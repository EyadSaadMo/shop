import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/utilis/app_strings/app_strings_screen.dart';
import '../../../../core/utilis/constants.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/view/shopping_cart.dart';
import '../../../cart/widgets/added_to_cart_item.dart';
import '../../../home/data/model/home_model.dart';
import '../../../home/presentaion/cubit/cubit.dart';
class BuildGridProduct extends StatelessWidget {
  ProductsModel model;
   Function()? onPressed;
   BuildGridProduct({Key? key,required this.model,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white,
                  child: Image(
                    image: CachedNetworkImageProvider(model.image),
                    width: double.infinity,
                    height: 200.0,
                  ),
                ),
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
                      ShopCubit.get(context).favorites[model.id]!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: ShopCubit.get(context).favorites[model.id]!
                          ? Colors.deepPurpleAccent
                          : Colors.grey[800],
                    ),
                    onPressed: () {
                      ShopCubit.get(context).changeFavorites(model.id);
                    },
                  ),
                ),
              ),
              if (model.discount != 0)
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
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
            height: 5,
          ),
          Text(
            model.name,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                priceFix(model.price.toString()),
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
              if (model.discount != 0)
                Text(
                  priceFix(model.oldPrice.round().toString()),
                  style: TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          AddedToCart(
            label: AppStrings.addToCart,
            onPressed: () {
              CartCubit.get(context).addProductToCart(model.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(AppStrings.addToCartSuccess),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: AppStrings.goToCart,
                    onPressed: () {
                      CartCubit.get(context).getInCartProducts();
                      Navigator.of(context).pushNamed(
                        ShoppingCart.routeName,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}
