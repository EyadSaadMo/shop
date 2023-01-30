import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/cubit.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/style/constants.dart';
import 'core/theme/states.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/themes.dart';
import 'features/presentation/auth/login/data/cubit/cubit.dart';
import 'features/presentation/onboarding/onBoarding_screen.dart';
import 'features/presentation/shop_layout.dart';
import 'features/presentation/auth/login/presentation/screens/shop_login_screen.dart';


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
    else widget = ShopLoginScreen();
  }
  else widget= OnBoardingScreen();


  runApp(MyApp(
    // isDark: isDark,
    homeWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
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
              ShopCubit()..getHomeData()..getCategories()..getFavourites()..getUserData()
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
              home: homeWidget,
              // initialRoute: '/',
              // routes: {
              //   DetailsScreen.routeName:(context) =>DetailsScreen();
              //
              // },
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