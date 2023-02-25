import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/utilis/constants.dart';
import '../data/model/get_cart.dart';
import '../presentation/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {

final  ProductInCart model;
Function()? onPressed;
   CartItem({Key? key, required this.model,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              color:Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(model.product!.image),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${model.product!.name}',
                        style:Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              priceFix(model.product!.price.toString()),
                              style:Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                child: IconButton(
                                  onPressed: () {
                                    CartCubit.get(context)
                                        .updateQuantityOfInCartProduct(
                                        model.inCartID, model.quantity + 1);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${model.quantity}',
                                style:Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 15,
                                child: IconButton(
                                  onPressed: () {
                                    if (model.quantity > 1) {
                                      CartCubit.get(context)
                                          .updateQuantityOfInCartProduct(
                                          model.inCartID,
                                          model.quantity - 1);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              CartCubit.get(context)
                                  .deleteProductFromCart(model.inCartID);
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red[800],
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
