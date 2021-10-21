import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_challenges/layout/shop_app/cubit/states.dart';
import 'package:flutter_challenges/models/shop_app/categories_model.dart';
import 'package:flutter_challenges/models/shop_app/home_model.dart';
import 'package:flutter_challenges/shared/component/components.dart';
import 'package:flutter_challenges/shared/style/colors.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state)
      {
        if(state is ShopSuccessChangeFavouritesState){
          if(state.model.status == false){
            showToast(msg: state.model.message, state: ToastStates.ERROR);
          }
        }
      },
      builder: (context, state) => ConditionalBuilder(
        condition: ShopCubit.get(context).homeModel != null &&
            ShopCubit.get(context).categoriesModel != null,
        builder: (context) => builderWidget(ShopCubit.get(context).homeModel,
            ShopCubit.get(context).categoriesModel, context),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget builderWidget(
      HomeModel? model, CategoriesModel? categoriesModel, context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            //  كده هيرجع ليست باالصور اللي عندي هيلف على عدد البانرز بعددهم
            //  وهيريترن ليست من البانر بإيدي بانر بانر
            //  وبعدين بحولها ل ليست أوف حاجه اللي هيا جمب الأنونيموس ميثود
            items: model!.data.banners
                .map(
                  (e) => Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 100.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildCategoriesItem(categoriesModel!.data.data[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.0,
                    ),
                    itemCount: categoriesModel!.data.data.length,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'New Products',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // main and cross will make space between each other
              // فوق وتحت
              crossAxisSpacing: 1.0,
              // يمين وشمال
              mainAxisSpacing: 1.0,
              // height/width
              // التاني بتاع الطول
              childAspectRatio: 1 / 1.75,
              children: List.generate(
                model.data.products.length,
                (index) =>
                    buildGridProduct(model.data.products[index], context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridProduct(ProductsModel? model, context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model!.image),
                  width: double.infinity,
                  height: 200.0,
                ),
                if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name.toString()}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.4,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.toString()}',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.oldPrice.toString()}',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          print(model.id);
                           ShopCubit.get(context).changeFavourites(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                         backgroundColor: ShopCubit.get(context).favourites[model.id] == true?defaultColor :Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Widget buildCategoriesItem(DataModel? model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              model!.image,
            ),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Container(
            width: 100.0,
            color: Colors.black.withOpacity(0.8),
            child: Text(
              model.name.toString(),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      );
}
