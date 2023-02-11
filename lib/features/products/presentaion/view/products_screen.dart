import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/categories/presentaion/cubit/categories_cubit.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../../../core/utilis/constants.dart';
import '../../../auth/login/widgets/toast_screen.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import '../../../home/presentaion/cubit/states.dart';
import '../widgets/caresol_prduct.dart';


class ProductsScreen extends StatelessWidget {
  static const routeName = 'product_screen';
  @override
  Widget build(BuildContext context) {
    print(token);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
          if (!state.model.status) {
            showToast(msg: state.model.message, state: ToastStates.ERROR);
          }
        }
      },
      builder: (context, state) {
        return
        ShopCubit.get(context).homeModel != null &&
            CategoriesCubit.get(context).categoriesModel != null?
        BuildCarouselProduct(
             model: ShopCubit.get(context).homeModel,
              categoriesModel: CategoriesCubit.get(context).categoriesModel,
              ):
         Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}





