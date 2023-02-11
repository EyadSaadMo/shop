import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/auth/login/widgets/custom_button.dart';
import 'package:flutter_challenges/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_challenges/features/cart/widgets/cart_item.dart';
import 'package:flutter_challenges/features/details/presentaion/cubit/details_cubit.dart';
import '../../../../core/style/constants.dart';
import '../../../details/presentaion/view/product_details.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import '../../../home/presentaion/view/shop_layout.dart';
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
            title: Text('Shopping Cart'),
          ),
          body:
        state is! LoadingGetCartState?
           ( (CartCubit
              .get(context)
              .getCart!
              .cartDetails!
              .products
              .length !=
              0)
              ? Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
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
                      color: Colors.grey[200],
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
                            child: defaultButton(
                              text: AppStrings.checkout,
                              function: () {},
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
                Text(
                  AppStrings.emptyCart,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppStrings.checkProductAndOrder,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: defaultButton(
                    text: AppStrings.checkProducts,
                    function: () {
                      Navigator.of(context).pushReplacementNamed(
                        Layout.routeName,
                      );
                    },
                  ),
                ),
              ],
            ),
          )):
        Center(
        child: CircularProgressIndicator(),
        ));
        }
    );

    // Conditional.single(
          //   context: context,
          //   conditionBuilder: (context) => state is! ShopLoadingGetCartState,
          //   widgetBuilder: (context) {
          //     return (ShopCubit.get(context)
          //         .getCart!
          //         .cartDetails!
          //         .products
          //         .length !=
          //         0)
          //         ? Container(
          //       decoration: BoxDecoration(
          //         color: Colors.grey[100],
          //         borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(30.0),
          //           topRight: Radius.circular(30.0),
          //         ),
          //       ),
          //       child: Column(
          //         children: [
          //           Expanded(
          //             flex: 6,
          //             child: ListView.separated(
          //               padding: EdgeInsets.symmetric(
          //                   vertical: 20, horizontal: 10),
          //               itemBuilder: (context, index) =>
          //                   CartItem(
          //                  model: ShopCubit.get(context)
          //                       .getCart!
          //                       .cartDetails!
          //                       .products[index],
          //                   onPressed: ()
          //                   {
          //                 ShopCubit.get(context).getProductDetails(
          //                     ShopCubit.get(context)
          //                         .getCart!
          //                         .cartDetails!
          //                         .products[index]
          //                         .product!
          //                         .id);
          //                 Navigator.of(context).pushNamed(
          //                   ProductDetails.routeName,
          //                 );
          //               }
          //               ),
          //               separatorBuilder: (context, index) => SizedBox(
          //                 height: 10.0,
          //               ),
          //               itemCount: ShopCubit.get(context)
          //                   .getCart!
          //                   .cartDetails!
          //                   .products
          //                   .length,
          //             ),
          //           ),
          //           if (state is ShopLoadingDeleteProductFromCartState ||
          //               state is ShopLoadingUpdateQuantityState ||
          //               state is ShopLoadingGetCartState)
          //             LinearProgressIndicator(
          //               color: Colors.deepPurpleAccent,
          //             ),
          //           Expanded(
          //             flex: 1,
          //             child: Container(
          //               padding:
          //               const EdgeInsets.symmetric(horizontal: 20.0),
          //               decoration: BoxDecoration(
          //                 color: Colors.grey[200],
          //                 borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(30.0),
          //                   topRight: Radius.circular(30.0),
          //                 ),
          //               ),
          //               child: Row(
          //                 children: [
          //                   Expanded(
          //                     child: Text(
          //                       priceFix(ShopCubit.get(context)
          //                           .getCart!
          //                           .cartDetails!
          //                           .total
          //                           .toString()),
          //                       style: TextStyle(
          //                         fontSize: 25.0,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                   ),
          //                   Expanded(
          //                     child: ClipRRect(
          //                       borderRadius: BorderRadius.circular(10.0),
          //                       child: defaultButton(
          //                         text: AppStrings.checkout,
          //                         function: () {},
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          //         : Center(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Image.asset(
          //             'assets/images/empty_cart.jpg',
          //             height: 250,
          //             width: 250,
          //           ),
          //           Text(
          //             AppStrings.emptyCart,
          //             style: TextStyle(
          //               fontSize: 20.0,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           Text(
          //             AppStrings.checkProductAndOrder,
          //             style: TextStyle(
          //               fontSize: 15.0,
          //               color: Colors.deepPurple,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 20.0,
          //           ),
          //           ClipRRect(
          //             borderRadius: BorderRadius.circular(20.0),
          //             child: defaultButton(
          //                 text: AppStrings.checkProducts,
          //                 function: () {
          //                   Navigator.of(context).pushReplacementNamed(
          //                     Layout.routeName,
          //                   );
          //                 },
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          //   fallbackBuilder: (context) =>
          // ),
  }

}