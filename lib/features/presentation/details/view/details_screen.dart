import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/domain/home_model.dart';
import 'package:flutter_challenges/features/presentation/details/cubit/details_cubit.dart';

import '../../../../core/cubit/cubit.dart';
import '../../../../core/cubit/states.dart';

import '../../../widgets/details_item.dart';
import '../../../widgets/toast_screen.dart';

class DetailsScreen extends StatelessWidget {

  static const routeName = 'details';

  @override
  Widget build(BuildContext context) {
    ProductsModel details =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is ShopSuccessChangeCartStates){
          if(state.changeCartModel.status == false){
            showToast(msg: state.changeCartModel.message, state: ToastStates.ERROR);
          }
          else showToast(msg: state.changeCartModel.message, state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ProductDetailsLoadingState,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Product Details'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart_outlined,color: ShopCubit.get(context).cart[details.id]==true?Colors.blue:Colors.grey,),
                        onPressed: () {
                          print(details.id);
                          ShopCubit.get(context).addOrDeleteCartItem(details.id);
                        }

                        ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: DetailsItem( model: details,),
                  )
                ],
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}
