import 'package:flutter_challenges/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_challenges/shared/component/components.dart';
import 'package:flutter_challenges/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}
  void printFullText(String? text)
  {
    final pattern= RegExp('.{1,800}'); // 800 the size of each chunk
    pattern.allMatches(text!).forEach((match) => print(match.group(0)));
  }
 late String? token ;
late String? uId='';