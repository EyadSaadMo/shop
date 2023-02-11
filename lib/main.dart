import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter_challenges/features/cart/presentation/view/shopping_cart.dart';
import 'package:flutter_challenges/features/profile/presentation/view/profile_screen.dart';
import 'package:flutter_challenges/features/search/presentaion/cubit/cubit.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/utilis/constants.dart';
import 'core/theme/states.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/themes.dart';
import 'features/about_us/presentation/view/about_us_screen.dart';
import 'features/auth/login/presentaion/cubit/cubit.dart';
import 'features/auth/login/presentaion/view/login_screen.dart';
import 'features/auth/register/presentaion/view/register_screen.dart';
import 'features/categories/presentaion/cubit/categories_cubit.dart';
import 'features/categories/presentaion/view/categories_screen.dart';
import 'features/details/presentaion/cubit/details_cubit.dart';
import 'features/details/presentaion/view/product_details.dart';
import 'features/favoutites/presentaion/view/favorite_screen.dart';
import 'features/home/presentaion/cubit/cubit.dart';
import 'features/home/presentaion/view/shop_layout.dart';
import 'features/onboarding/presentation/view/onBoarding.dart';
import 'features/onboarding/presentation/view/splash.dart';
import 'features/orders/presentation/orders_screen.dart';
import 'features/products/presentaion/view/products_screen.dart';
import 'features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'features/search/presentaion/view/search_screen.dart';
import 'features/settings/presentaion/cubit/update_user_cubit.dart';
import 'features/settings/presentaion/view/setting_screen.dart';
import 'features/terms_and_condition/presentation/view/terms_condition_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bool isDark = CacheHelper.getData(key: 'isDark');
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding')?? false;
   token = CacheHelper.getData(key: 'token')??'';

  runApp(MyApp(
    onBoardingSkip: onBoarding,
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  static const home = '/';
  final bool onBoardingSkip;
  final String  token;
  MyApp({
  required this.onBoardingSkip, required this.token});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ThemeCubit()
            // ..changeAppMode(fromShared: isDark)
          ),
          BlocProvider(
              create: (context) =>
                  LoginCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  SearchCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  DetailsCubit() ..getProductDetails(53),
          ),
          BlocProvider(
              create: (context) =>
                  UpdateUserCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  CartCubit()..getInCartProducts(),

    ),
          BlocProvider(
              create: (context) =>
                  ProfileCubit()..getUserData(),
          ),
          BlocProvider(
              create: (context) =>
                  CategoriesCubit()..getCategoriesData(),
          ),
          BlocProvider(
              create: (context) =>
              ShopCubit() ..getModelData()
                ..getFavoritesData()
          ),
        ],
        child: BlocConsumer<ThemeCubit, ThemeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'PickBag',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              routes: {
                ProductDetails.routeName:(context) =>ProductDetails(),
                OrdersScreen.routeName:(context) =>OrdersScreen(),
                AboutUsScreen.routeName:(context) =>AboutUsScreen(),
                TermsAndConditions.routeName:(context) =>TermsAndConditions(),
                SplashView.routeName:(context) =>SplashView(),
                ShoppingCart.routeName:(context) =>ShoppingCart(),
                Layout.routeName:(context) =>Layout(),
                SettingsScreen.routeName:(context) =>SettingsScreen(),
                ProfileScreen.routeName:(context) =>ProfileScreen(),
                SearchScreen.routeName:(context) =>SearchScreen(),
                ProductsScreen.routeName:(context) =>ProductsScreen(),
                FavouritesScreen.routeName:(context) =>FavouritesScreen(),
                CategoriesScreen.routeName:(context) =>CategoriesScreen(),
                RegisterScreen.routeName:(context) =>RegisterScreen(),
                LoginScreen.routeName:(context) =>LoginScreen(),

              },
              home: onBoardingSkip?((token.isEmpty)?LoginScreen():Layout()):OnBoardingView(),
            );
          },
        ));
  }
}