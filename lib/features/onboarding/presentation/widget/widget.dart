import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/style/colors.dart';

class BuildDots extends StatelessWidget {
  final int index;
  final int currentPage;
  const BuildDots({ required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: defaultColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: currentPage == index ? 20 : 10,
    );
  }
}