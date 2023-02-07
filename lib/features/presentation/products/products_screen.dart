import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/screen%20size/screen_size.dart';
import 'package:flutter_challenges/features/presentation/categories/cubit/categories_cubit.dart';
import 'package:flutter_challenges/features/widgets/build_home_item.dart';

import '../../../core/cubit/cubit.dart';
import '../../../core/cubit/states.dart';
import '../../widgets/toast_screen.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = 'products';
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state)
      {
        if(state is ShopSuccessChangeFavouritesState){
          if(state.model.status == false){
            showToast(msg: state.model.message, state: ToastStates.ERROR);
          }else
            showToast(msg: state.model.message, state: ToastStates.SUCCESS);

        }
      },

      builder: (context, state) {
        if (ShopCubit
            .get(context)
            .homeModel != null &&
            CategoriesCubit
                .get(context)
                .categoriesModel != null)
          return HomeItems(model: ShopCubit.get(context).homeModel, categoriesModel: CategoriesCubit.get(context).categoriesModel);
        else
          return Center(child: CircularProgressIndicator());
      }
      );
}


}
