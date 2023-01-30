import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/network/local/cache_helper.dart';
import '../../../core/style/colors.dart';
import '../../../core/widgets/text_button.dart';
import '../auth/login/presentation/screens/shop_login_screen.dart';


class BoardingModel {
  late final String? image;
  late final String? title;
  late final String? body;
  BoardingModel({this.image, this.title, this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  bool isLast = false;
  void submit(){
  CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    if(value){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ShopLoginScreen()),
              (Route<dynamic> route) => false);
    }
  });


  }
  List<BoardingModel> boarding = [
    BoardingModel(
      image:
          'https://image.freepik.com/free-vector/cute-shopping-cart-logo_23-2148453859.jpg',
      title: 'On Boarding 1 Title',
      body: 'On Boarding 1 Title',
    ),
    BoardingModel(
      image:
          'https://image.freepik.com/free-vector/different-elements-online-shopping_1085-848.jpg',
      title: 'On Boarding 2 Title',
      body: 'On Boarding 2 Title',
    ),
    BoardingModel(
      image:
          'https://image.freepik.com/free-vector/realistic-supermarket-trolley-full-items_1284-35992.jpg',
      title: 'On Boarding 3 Title',
      body: 'On Boarding 3 Title',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          defaultTextButton(function: () {
            submit();
          }, text: 'skip'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (int? index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    isLast = false;
                  }
                },
                controller: boardingController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                    child: Icon(Icons.arrow_forward), onPressed: () {
                      if(isLast){
                        submit();
                      }
                      else{
                        boardingController.nextPage(duration: Duration(microseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                      }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: NetworkImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        ' ${model.title}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
