import 'package:flutter/material.dart';
import 'package:flutter_challenges/modules/Responsive%20and%20adaptive/desktop_screen.dart';
import 'package:flutter_challenges/modules/Responsive%20and%20adaptive/mobile_Screen.dart';
import 'package:flutter_challenges/modules/login/login_Screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
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
     }
}
/*
1. lgoin  tasks
2. checout master
 */