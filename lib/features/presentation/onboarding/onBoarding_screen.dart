import 'package:flutter/material.dart';
import 'package:flutter_challenges/features/presentation/onboarding/component/body.dart';
import '../../../core/network/local/cache_helper.dart';
import '../../../core/utilis/screen size/screen_size.dart';
import '../../widgets/text_button.dart';
import '../auth/login/presentation/screens/shop_login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/';

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          defaultTextButton(
              function: () {
                submit();
              },
              text: 'skip'),
        ],
      ),
      body: Body(),
    );
  }
}
