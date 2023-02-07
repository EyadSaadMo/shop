import 'package:flutter/material.dart';
import 'package:flutter_challenges/features/domain/categories_model.dart';
import 'package:flutter_challenges/features/domain/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_challenges/features/widgets/category_item.dart';
import 'package:flutter_challenges/features/widgets/product_item.dart';

import '../../core/utilis/screen size/screen_size.dart';
import '../domain/cart_model.dart';
class HomeItems extends StatelessWidget {
  final HomeModel? model;
  final CategoriesModel? categoriesModel;
   HomeItems({Key? key,required this.model,required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model!.data.banners
                .map(
                  (e) => Image(
                image: CachedNetworkImageProvider('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
                .toList(),
            options: CarouselOptions(
              height: getProportionateScreenHeight(250),
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
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10)),
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
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Container(
                  height: getProportionateScreenHeight(100),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        CategoryItem(model: categoriesModel!.data.data[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.0,
                    ),
                    itemCount: categoriesModel!.data.data.length,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
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
          SizedBox(height: SizeConfig.screenHeight * 0.01),

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
                model!.data.products.length,
                    (index) =>
                ProductItems(model: model!.data.products[index]),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
