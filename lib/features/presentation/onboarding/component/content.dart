import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/utilis/screen size/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    this.text,
    this.image,
    this.body
  }) : super(key: key);
  final String? text, image,body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          text!,
          textAlign: TextAlign.center,
      style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: defaultColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight*0.04,),
        Text(
          body!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Spacer(flex: 2),
    Image(image: CachedNetworkImageProvider(image!),
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}