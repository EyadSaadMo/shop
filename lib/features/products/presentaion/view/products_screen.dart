import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/categories/presentaion/cubit/categories_cubit.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/utilis/app_strings/app_strings_screen.dart';
import '../../../../core/utilis/constants.dart';
import '../../../auth/login/widgets/toast_screen.dart';
import '../../../home/presentaion/cubit/cubit.dart';
import '../../../home/presentaion/cubit/states.dart';
import '../../../search/presentaion/view/search_screen.dart';
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
        return Scaffold(
          appBar:  AppBar(
            backgroundColor: AppBarTheme.of(context).backgroundColor,
            title: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 30.0,
                  width: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  AppStrings.appBarName,
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryIconTheme.color
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SearchScreen.routeName,
                  );
                },
              ),
            ],
          ),

          body: ShopCubit.get(context).homeModel != null &&
              CategoriesCubit.get(context).categoriesModel != null?
          BuildCarouselProduct(
            model: ShopCubit.get(context).homeModel,
            categoriesModel: CategoriesCubit.get(context).categoriesModel,
          ):
          Center(
            child: CircularProgressIndicator(),
          ),
        );

      },
    );
  }
}





