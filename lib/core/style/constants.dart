import 'package:flutter/material.dart';

import '../../features/presentation/auth/login/presentation/screens/shop_login_screen.dart';
import '../network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginScreen()), (route) => false);
    }
  });
}
  void printFullText(String? text)
  {
    final pattern= RegExp('.{1,800}'); // 800 the size of each chunk
    pattern.allMatches(text!).forEach((match) => print(match.group(0)));
  }
 late String? token ;
