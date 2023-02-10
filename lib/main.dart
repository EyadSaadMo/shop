import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/style/constants.dart';
import 'core/theme/states.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/themes.dart';
import 'features/auth/login/presentaion/cubit/cubit.dart';
import 'features/auth/login/presentaion/view/login_screen.dart';
import 'features/auth/register/presentaion/view/register_screen.dart';
import 'features/cart/presentation/view/cart_screen.dart';
import 'features/categories/presentaion/cubit/categories_cubit.dart';
import 'features/categories/presentaion/view/categories_screen.dart';
import 'features/details/presentaion/cubit/details_cubit.dart';
import 'features/details/presentaion/view/details_screen.dart';
import 'features/favoutites/presentaion/view/favourites_screen.dart';
import 'features/home/presentaion/cubit/cubit.dart';
import 'features/home/presentaion/view/shop_layout.dart';
import 'features/onboarding/presentation/view/onBoarding.dart';
import 'features/onboarding/presentation/view/splash.dart';
import 'features/products/presentaion/view/products_screen.dart';
import 'features/search/presentaion/view/search_screen.dart';
import 'features/settings/presentaion/cubit/update_user_cubit.dart';
import 'features/settings/presentaion/profile_cubit/profile_cubit.dart';
import 'features/settings/presentaion/view/settings_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // bool isDark = CacheHelper.getData(key: 'isDark');
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
   token = CacheHelper.getData(key: 'token');
  // print(token);
  Widget widget= Layout();
  if(onBoarding != null)
  {
    if(token != null) widget = Layout();
    else widget = LoginScreen();
  }
  else widget= OnBoardingView();


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
              title: 'PickBag',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              initialRoute: '/',
              routes: {
                "/":(context)=>homeWidget,
                DetailsScreen.routeName:(context) =>DetailsScreen(),
                SplashView.routeName:(context) =>SplashView(),
                CartScreen.routeName:(context) =>CartScreen(),
                Layout.routeName:(context) =>Layout(),
                SettingsScreen.routeName:(context) =>SettingsScreen(),
                SearchScreen.routeName:(context) =>SearchScreen(),
                ProductsScreen.routeName:(context) =>ProductsScreen(),
                FavouritesScreen.routeName:(context) =>FavouritesScreen(),
                CategoriesScreen.routeName:(context) =>CategoriesScreen(),
                RegisterScreen.routeName:(context) =>RegisterScreen(),
                LoginScreen.routeName:(context) =>LoginScreen(),

              },
            );
          },
        ));
  }
}