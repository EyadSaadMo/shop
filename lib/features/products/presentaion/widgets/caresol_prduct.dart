import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_challenges/features/products/presentaion/widgets/see_all.dart';

import '../../../../core/utilis/app_strings/app_strings_screen.dart';
import '../../../categories/data/model/categories_model.dart';
import '../../../details/presentaion/cubit/details_cubit.dart';
import '../../../details/presentaion/view/product_details.dart';
import '../../../home/data/model/home_model.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import 'categories_items.dart';
import 'grid_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
class BuildCarouselProduct extends StatelessWidget {

  final HomeModel? model;
  final CategoriesModel? categoriesModel;

  const BuildCarouselProduct({Key? key, this.model, this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            CarouselSlider(
              items: model!.data.banners
                  .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: CachedNetworkImageProvider('${e.image}'),
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: 200.0,
                autoPlay: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.easeInBack,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SeeAll(
                onPressed: ShopCubit.get(context).incIndex, title: AppStrings.categories),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 125,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => BuildCategoryItem(
                  image: categoriesModel!.data.data[index].image,
                  name: categoriesModel!.data.data[index].name,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 15.0,
                ),
                itemCount: categoriesModel!.data.data.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SeeAll(onPressed: () {}, title: AppStrings.newProduct),
            SizedBox(
              height: 10.0,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1 / 1.85,
              children: List.generate(
                model!.data.products.length,
                    (index) =>
                    BuildGridProduct(model:model!.data.products[index],
                      onPressed:(){
                        DetailsCubit.get(context)
                            .getProductDetails(model!.data.products[index].id);
                        Navigator.of(context).pushNamed(
                          ProductDetails.routeName,
                        );
                      },
                    ),
              ),
            ),
           SizedBox(height: 35,),
          ],
        ),
      ),
    );
  }

}
