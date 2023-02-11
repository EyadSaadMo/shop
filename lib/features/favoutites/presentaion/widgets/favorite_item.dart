import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';

import '../../../home/presentaion/cubit/cubit.dart';
import '../../data/model/favourites_model.dart';

class FavoriteItem extends StatelessWidget {
  final FavouritesData model;
  const FavoriteItem({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 130.0,
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white,
                  child: Image(
                    image: NetworkImage(model.product.image),
                    width: 140.0,
                    height: 120.0,
                  ),
                ),
              ),
              if (model.product.discount != 0)
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        )),
                    child: Text(
                      AppStrings.discount,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.product.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.product.price} ${AppStrings.lE}',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            decorationStyle: TextDecorationStyle.dashed,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        if (model.product.discount != 0)
                          Text(
                            '${model.product.oldPrice} ${AppStrings.lE}',
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, top: 5.0),
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            ShopCubit.get(context).favorites[model.product.id]!
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: ShopCubit.get(context)
                                .favorites[model.product.id]!
                                ? Colors.deepPurpleAccent
                                : Colors.grey[800],
                          ),
                          onPressed: () {
                            ShopCubit.get(context)
                                .changeFavorites(model.product.id);
                          },
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
  }
}
