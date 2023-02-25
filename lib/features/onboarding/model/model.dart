
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';

class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: AppStrings.onBoardingTitle1,
    image: "assets/images/market.jpg",
    desc:
    AppStrings.onBoardingSubTitle1,
  ),
  OnBoardingContents(
    title: AppStrings.onBoardingTitle2,
    image: "assets/images/bag.jpg",
    desc: AppStrings.onBoardingSubTitle2,
  ),
  OnBoardingContents(
    title: AppStrings.onBoardingTitle3,
    image: "assets/images/fast_delivery.jpg",
    desc: AppStrings.onBoardingSubTitle3,
  ),
];