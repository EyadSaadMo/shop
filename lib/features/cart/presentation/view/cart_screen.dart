import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/core/utilis/screen%20size/screen_size.dart';
import 'package:flutter_challenges/features/cart/widgets/cart_item.dart';

import '../../../auth/login/widgets/divider.dart';
import '../../../auth/login/widgets/toast_screen.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import '../../../home/presentaion/cubit/states.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart_item';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeCartStates) {
          if (state.changeCartModel.status == false) {
            showToast(
                msg: state.changeCartModel.message, state: ToastStates.ERROR);
          } else
            showToast(
                msg: state.changeCartModel.message, state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  AppStrings.totalAmount,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                Text(
                  "${ShopCubit.get(context).counter * ShopCubit.get(context).cartModel!.data.total}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          body: state is! ShopLoadingGetCartsState
              ? ListView.separated(
                  itemBuilder: (context, index) => CartItem(
                      model: ShopCubit.get(context)
                          .cartModel!
                          .data
                          .cartItems[index]
                          .product),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount:
                      ShopCubit.get(context).cartModel!.data.cartItems.length)
              : Center(
                  child: Text(
                  AppStrings.addProductCart,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: GestureDetector(
              child: Container(
                width: double.infinity,
                height: getProportionateScreenHeight(80),
                color: Colors.red,
                child: Center(
                  child: Text(
                    AppStrings.checkout,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        );
      },
    );
  }
}
// floatingActionButton: Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 0),
//   child: GestureDetector(
//     child: Container(
//       width: double.infinity,
//       height: getProportionateScreenHeight(80),
//       color: Colors.red,
//       child: Center(child: Text('Checkout',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),),),
//     ),
//     onTap: (){},
//   ),
// ),
//

/*
            floatingActionButton: Column(
              children: [
                Row(
                  children: [
                    Text('total amount:',style: Theme.of(context).textTheme.bodyText1,),
                    Spacer(),
                    Text('0',style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
                defaultButton(text: 'Checkout', function: (){}),
              ],
            ),

 */
