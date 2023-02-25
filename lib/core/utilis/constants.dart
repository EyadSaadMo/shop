import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';

import '../../features/auth/login/presentaion/view/login_screen.dart';
import '../network/local/cache_helper.dart';

String token ='' ;

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }
  });
}
  void printFullText(String? text)
  {
    final pattern= RegExp('.{1,800}'); // 800 the size of each chunk
    pattern.allMatches(text!).forEach((match) => print(match.group(0)));
  }
String priceFix(String price) {
  if (price.length == 7) {
    return '${price.substring(0, 1)},${price.substring(1, price.length)} ${AppStrings.lE}';
  } else if (price.length == 6) {
    return '${price.substring(0, 3)},${price.substring(3, price.length)} ${AppStrings.lE}';
  } else if (price.length == 5) {
    return '${price.substring(0, 2)},${price.substring(2, price.length)} ${AppStrings.lE}';
  } else if (price.length == 4) {
    return '${price.substring(0, 1)},${price.substring(1, price.length)} ${AppStrings.lE}';
  } else {
    return '$price  ${AppStrings.lE}';
  }
}