import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenges/shared/style/colors.dart';
import 'package:hexcolor/hexcolor.dart';
// أي حاجه بت apply على ألابليكيشن كله
ThemeData lightTheme= ThemeData(
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  // ده بيغير كل حاجه معاك في ال app
  primarySwatch: defaultColor,
  //عشان أغير لون ال scaffold في الكل
  scaffoldBackgroundColor: Colors.white,
  // first thing
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    // فيها حاجات تنطبق على ال app bar اللي في ال app كله
    backgroundColor: Colors.white,
    elevation: 0.0,
    // عاوز بقا أغير ال status bar
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Jannah',
      color: Colors.black,
    ),
    // عشان أعدل في لون الحاجات اللي في ال action جوه ال app bar
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    // عملته false عشان اعرف اتحكم في ال status bar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //عاوز أغير في لون ال Button nav bar
    selectedItemColor: defaultColor,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    //عاوز أغير في لون ال Button nav bar
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  fontFamily: 'Jannah',
);
ThemeData darkTheme= ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),
  //عشان أغير لون ال scaffold في الكل
  // first thing
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    // فيها حاجات تنطبق على ال app bar اللي في ال app كله
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    // عاوز بقا أغير ال status bar
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',

      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    // عشان أعدل في لون الحاجات اللي في ال action جوه ال app bar
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    // عملته false عشان اعرف اتحكم في ال status bar
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    //عاوز أغير في لون ال Button nav bar
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.3,
    ),
  ),
  fontFamily: 'Jannah',
);