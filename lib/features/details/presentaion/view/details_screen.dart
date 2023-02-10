import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/home/data/model/home_model.dart';
import '../../../auth/login/widgets/toast_screen.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import '../../../home/presentaion/cubit/states.dart';
import '../../widgets/details_item.dart';
import '../cubit/details_cubit.dart';

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
        if( state is! ProductDetailsLoadingState)
        return Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.productDetails),
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
        else return Center(child: CircularProgressIndicator());

      },
        );

  }

}
