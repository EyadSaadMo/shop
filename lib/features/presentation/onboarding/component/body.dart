import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/style/colors.dart';
import 'package:flutter_challenges/features/widgets/custom_button.dart';
import 'package:flutter_challenges/features/presentation/auth/login/presentation/screens/shop_login_screen.dart';
import 'package:flutter_challenges/features/presentation/onboarding/component/content.dart';

import '../../../../core/utilis/screen size/screen_size.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> boarding = [
    {
      'text':'pickBag App',
      'body':'"Welcome to pickBag, Let’s shop!',
      'image': 'https://image.freepik.com/free-vector/cute-shopping-cart-logo_23-2148453859.jpg',
    },   {
      'text':'Bag Cart',
      'body':'Your App has cart to put items on it',
      'image':           'https://image.freepik.com/free-vector/different-elements-online-shopping_1085-848.jpg',
    },   {
      'text':'Easy connection',
      'body':'We show the easy way to shop. \nJust stay at home with us',
      'image':           'https://image.freepik.com/free-vector/realistic-supermarket-trolley-full-items_1284-35992.jpg',
    }, ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: boarding.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: boarding[index]["image"],
                  text: boarding[index]['text'],
                  body: boarding[index]['body'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(boarding.length, (index) => buildDot(index: index)),
                    ),
                    Spacer(flex: 3),
                    defaultButton(
                      text: "Continue",
                      function: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? defaultColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}