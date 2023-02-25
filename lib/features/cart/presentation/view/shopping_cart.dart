import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_challenges/features/cart/widgets/cart_item.dart';
import 'package:flutter_challenges/features/checkout/presentation/checkout_screen.dart';
import 'package:flutter_challenges/features/details/presentaion/cubit/details_cubit.dart';
import '../../../../core/utilis/constants.dart';
import '../../../details/presentaion/view/product_details.dart';
import '../../../home/presentaion/view/shop_layout.dart';
import '../../../home/presentaion/widgets/default_button.dart';
import '../cubit/cart_cubit.dart';
class ShoppingCart extends StatelessWidget {
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.shoppingCart),
          ),
          body:
        state is! LoadingGetCartState?
           ((CartCubit.get(context).getCart!.cartDetails!.products.length != 0)?
               Container(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    itemBuilder: (context, index) =>
                        CartItem(
                            model: CartCubit
                                .get(context)
                                .getCart!
                                .cartDetails!
                                .products[index],
                            onPressed: () {
                              DetailsCubit.get(context).getProductDetails(
                                  CartCubit
                                      .get(context)
                                      .getCart!
                                      .cartDetails!
                                      .products[index]
                                      .product!
                                      .id);
                              Navigator.of(context).pushNamed(
                                ProductDetails.routeName,
                              );
                            }
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 10.0,
                        ),
                    itemCount: CartCubit
                        .get(context)
                        .getCart!
                        .cartDetails!
                        .products
                        .length,
                  ),
                ),
                if (state is LoadingDeleteProductFromCartState ||
                    state is LoadingUpdateQuantityState ||
                    state is LoadingGetCartState)
                  LinearProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            priceFix(CartCubit
                                .get(context)
                                .getCart!
                                .cartDetails!
                                .total
                                .toString()),
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: MainButton(
                              text: AppStrings.checkout,
                              onPressed: () {
                                Navigator.of(context).pushNamed(CheckoutScreen.routeName);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_cart.jpg',
                  height: 250,
                  width: 250,
                ),
                SizedBox(height: 15,),
                Text(
                  AppStrings.emptyCart,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  AppStrings.checkProductAndOrder,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: MainButton(
                      text: AppStrings.checkProducts,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          Layout.routeName,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ))
       : Center(
        child: CircularProgressIndicator(),
        ),
        );
        }
    );
  }

}