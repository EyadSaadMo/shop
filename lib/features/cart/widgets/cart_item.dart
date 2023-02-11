import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utilis/constants.dart';
import '../../home/presentaion/cubit/cubit.dart';
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
            //height: 150,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: NetworkImage(model.product!.image),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
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
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
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
