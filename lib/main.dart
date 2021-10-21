import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_challenges/layout/shop_app/shop_layout.dart';
import 'package:flutter_challenges/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_challenges/modules/shop_app/onBoarding/onBoarding_screen.dart';
import 'package:flutter_challenges/shared/component/constants.dart';
import 'package:flutter_challenges/shared/cubit/cubit.dart';
import 'package:flutter_challenges/shared/cubit/states.dart';
import 'package:flutter_challenges/shared/network/local/cache_helper.dart';
import 'package:flutter_challenges/shared/network/remote/dio_helper.dart';
import 'package:flutter_challenges/shared/style/themes.dart';
import 'shared/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
    // bool isDark = CacheHelper.getData(key: 'isDark');
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
   token = CacheHelper.getData(key: 'token');
   print(token);
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
                  AppCubit()
                    // ..changeAppMode(fromShared: isDark)
          ),
          BlocProvider(
              create: (context) =>
                  ShopCubit()..getHomeData()..getCategories()..getFavourites()..getUserData()
          ),
          BlocProvider(
              create: (context) =>
                  ShopCubit()..getUserData()
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: homeWidget,
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
