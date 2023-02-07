
// import 'package:flutter/cupertino.dart';
//
// Router <dynamic> onGenerate(RouteSettings settings){
//   switch(settings.name){
//     case
//   }
// }
import 'package:flutter/material.dart';

import '../../features/presentation/auth/login/presentation/screens/shop_login_screen.dart';
import '../../features/presentation/auth/register/register_screen.dart';
import '../../features/presentation/cart/cart_screen.dart';
import '../../features/presentation/categories/categories_screen.dart';
import '../../features/presentation/details/view/details_screen.dart';
import '../../features/presentation/favoutites/favourites_screen.dart';
import '../../features/presentation/products/products_screen.dart';
import '../../features/presentation/search/search_screen.dart';
import '../../features/presentation/settings/settings_screen.dart';
import '../../features/presentation/home/shop_layout.dart';

final Map<String, WidgetBuilder> routes = {

  DetailsScreen.routeName:(context) =>DetailsScreen(),
  // CartScreen.routeName:(context) =>CartScreen(),
  ShopLayout.routeName:(context) =>ShopLayout(),
  SettingsScreen.routeName:(context) =>SettingsScreen(),
  SearchScreen.routeName:(context) =>SearchScreen(),
  ProductsScreen.routeName:(context) =>ProductsScreen(),
  // OnBoardingScreen.routeName:(context) =>OnBoardingScreen(),
  FavouritesScreen.routeName:(context) =>FavouritesScreen(),
  CategoriesScreen.routeName:(context) =>CategoriesScreen(),
  RegisterScreen.routeName:(context) =>RegisterScreen(),
  LoginScreen.routeName:(context) =>LoginScreen(),
};
