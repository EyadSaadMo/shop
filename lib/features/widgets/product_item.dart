import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/screen%20size/screen_size.dart';
import 'package:flutter_challenges/features/widgets/text_button.dart';

import '../../core/cubit/cubit.dart';
import '../../core/style/colors.dart';
import '../domain/home_model.dart';
import '../presentation/details/view/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ProductItems extends StatelessWidget {
  ProductsModel model;
   ProductItems({required this.model,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(

      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: CachedNetworkImageProvider(model.image),
                  width: double.infinity,
                  height: getProportionateScreenHeight(200),
                ),
                if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
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
                      SizedBox(height: SizeConfig.screenHeight * 0.09),
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
                          backgroundColor: ShopCubit.get(context).favourites[model.id] == true?Colors.red :Colors.grey,
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
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 5),
          //     child: Center(child: Text('Add To Cart',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: defaultColor,fontSize: 16),)),
          //   ),
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(DetailsScreen.routeName,arguments: model);
      },
    );
  }

}
