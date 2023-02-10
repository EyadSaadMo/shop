import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/network/local/cache_helper.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';

import '../../../../../core/network/remote/end_points.dart';
import '../../../../../core/style/colors.dart';
import '../../../auth/login/presentaion/view/login_screen.dart';
import '../../../home/presentaion/view/shop_layout.dart';


class SplashView extends StatefulWidget {
  static const routeName = 'splash';
  const SplashView();

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController? animationController;
  Animation<double>? animation;

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    isLoggedIN =
       CacheHelper.getData(key: 'IsLoggedIn');
    isLoggedIN != null
        ? Navigator.pushReplacementNamed(context, Layout.routeName)
        : Navigator.pushReplacementNamed(context,LoginScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut);

    animation!.addListener(() => setState(() {}));
    animationController!.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon.jpg',
                width: animation!.value * 250,
                height: animation!.value * 250,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
               AppStrings.appName,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: defaultColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}