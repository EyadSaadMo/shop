import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/core/utilis/screen%20size/screen_size.dart';
import 'package:flutter_challenges/features/presentation/auth/login/domain/login_model.dart';
import 'package:flutter_challenges/features/presentation/auth/register/register_screen.dart';
import 'package:flutter_challenges/features/presentation/cart/cart_screen.dart';
import 'package:flutter_challenges/features/presentation/cart/cart_screen.dart';
import 'package:flutter_challenges/features/presentation/cart/cubit/cart_cubit.dart';
import 'package:flutter_challenges/features/presentation/categories/categories_screen.dart';
import 'package:flutter_challenges/features/presentation/categories/cubit/categories_cubit.dart';
import 'package:flutter_challenges/features/presentation/details/cubit/details_cubit.dart';
import 'package:flutter_challenges/features/presentation/favoutites/favourites_screen.dart';
import 'package:flutter_challenges/features/presentation/products/products_screen.dart';
import 'package:flutter_challenges/features/presentation/search/search_screen.dart';
import 'package:flutter_challenges/features/presentation/settings/settings_screen.dart';

import 'core/cubit/cubit.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/style/constants.dart';
import 'core/theme/states.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/themes.dart';
import 'features/presentation/auth/login/data/cubit/cubit.dart';
import 'features/presentation/details/view/details_screen.dart';
import 'features/presentation/onboarding/onBoarding_screen.dart';
import 'features/presentation/home/shop_layout.dart';
import 'features/presentation/auth/login/presentation/screens/shop_login_screen.dart';
import 'features/presentation/settings/cubit/update_user_cubit.dart';
import 'features/presentation/settings/profile_cubit/profile_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bool isDark = CacheHelper.getData(key: 'isDark');
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
   token = CacheHelper.getData(key: 'token');
  // print(token);
  Widget widget= ShopLayout();
  if(onBoarding != null)
  {
    if(token != null) widget = ShopLayout();
    else widget = LoginScreen();
  }
  else widget= OnBoardingScreen();


  runApp(MyApp(
    // isDark: isDark,
    homeWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  static const home = '/';
  // final bool isDark;
  final Widget homeWidget;
  MyApp({required this.homeWidget, });
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
                  DetailsCubit()..getDetails(),
          ),
          BlocProvider(
              create: (context) =>
                  UpdateUserCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  ProfileCubit()..getUserData(),
          ),
          BlocProvider(
              create: (context) =>
                  CategoriesCubit()..getCategories(),
          ),
          BlocProvider(
              create: (context) =>
              ShopCubit()..getHomeData()..getFavourites()..getCart()
          ),
        ],
        child: BlocConsumer<ThemeCubit, ThemeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Shop',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              // home: homeWidget,
              initialRoute: '/',
              routes: {
                "/":(context)=>homeWidget,
                DetailsScreen.routeName:(context) =>DetailsScreen(),
                // CartScreen.routeName:(context) =>CartScreen(),
                CartScreen.routeName:(context) =>CartScreen(),
                ShopLayout.routeName:(context) =>ShopLayout(),
                SettingsScreen.routeName:(context) =>SettingsScreen(),
                SearchScreen.routeName:(context) =>SearchScreen(),
                ProductsScreen.routeName:(context) =>ProductsScreen(),
                FavouritesScreen.routeName:(context) =>FavouritesScreen(),
                CategoriesScreen.routeName:(context) =>CategoriesScreen(),
                RegisterScreen.routeName:(context) =>RegisterScreen(),
                LoginScreen.routeName:(context) =>LoginScreen(),

              },
              // theme: ThemeData(primarySwatch: Colors.teal),
              // home: Builder(builder: (BuildContext context) {
              //   if(MediaQuery.of(context).size.width <= 560){
              //     return MediaQuery(
              //       data: MediaQuery.of(context).copyWith(
              //         textScaleFactor: 0.8
              //       ),
              //         child: MobileScreen());
              //   }
              //   else{
              //     return MediaQuery(
              //         data: MediaQuery.of(context).copyWith(
              //             textScaleFactor: 1.25,
              //         ),
              //         child: DesktopScreen());
              //   }
              // },),
              //

              // home: LayoutBuilder(
              //     builder: (BuildContext context, BoxConstraints constraints) {
              //      if(constraints.maxWidth <= 560){
              //        print(constraints.maxWidth);
              //        return MobileScreen();
              //      }
              //      else return DesktopScreen();
              //     },
              //    ),
            );
          },
        ));
  }
}