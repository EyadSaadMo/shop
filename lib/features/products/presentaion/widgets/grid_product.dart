import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_challenges/features/auth/login/widgets/text_button.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/utilis/app_strings/app_strings_screen.dart';
import '../../../../core/utilis/constants.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/view/shopping_cart.dart';
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
                    height: 150.0,
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
          Text(
            model.name,
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  priceFix(model.price.toString()),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              if (model.discount != 0)
                Expanded(
                  child: Text(
                    priceFix(model.oldPrice.round().toString()),
                    style: TextStyle(
                      fontSize: 14.0,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: MainTextButton(
                  text: AppStrings.addToCart,
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
              ),
              SizedBox(width: 5,),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only( top: 5.0),
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
                            ? defaultColor
                            : Colors.grey[800],
                      ),
                      onPressed: () {
                        ShopCubit.get(context).changeFavorites(model.id);
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

}
