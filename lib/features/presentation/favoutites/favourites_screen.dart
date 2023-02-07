import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/cubit.dart';
import '../../../core/cubit/states.dart';
import '../../widgets/divider.dart';
import '../../widgets/list_product.dart';
import '../../widgets/toast_screen.dart';

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
          Center(child: Text('plz Add some products to your cart',style: Theme.of(context).textTheme.bodyText1,))

        );
      },
    );
  }

}