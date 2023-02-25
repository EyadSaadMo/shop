import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../style/colors.dart';
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
      color: Colors.grey,
      height: 1.3,
    ),
    bodyText2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color:defaultColor,
    ),
  ),
  primaryIconTheme: IconThemeData(color: Colors.white),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 5,
 backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Jannah',
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: defaultColor,
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
  primaryIconTheme: IconThemeData(color: Colors.white),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),
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
    color: Colors.grey,
    height: 1.3,
  ),
    bodyText2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

),
  fontFamily: 'Jannah',
);