import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import '../../../auth/login/widgets/divider.dart';
import '../../../auth/login/widgets/toast_screen.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import '../../../home/presentaion/cubit/states.dart';
import '../../../products/widgets/list_product.dart';
class FavouritesScreen extends StatelessWidget {
  static const routeName = 'favorites';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is ShopSuccessChangeFavouritesState){
          if(state.model.status == false){
            showToast(msg: state.model.message, state: ToastStates.ERROR);
          }else
            showToast(msg: state.model.message, state: ToastStates.SUCCESS);

        }

      },
      builder: (context, state) {
        return Scaffold(
          body:state is !ShopLoadingGetFavouritesState?
          ListView.separated(
              itemBuilder: (context, index) => buildListProduct(
                  ShopCubit.get(context).favouritesModel!.data.data[index].product,
                  context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount:
              ShopCubit.get(context).favouritesModel!.data.data.length) :
          Center(child: Text(AppStrings.addProductFav,style: Theme.of(context).textTheme.bodyText1,))

        );
      },
    );
  }

}