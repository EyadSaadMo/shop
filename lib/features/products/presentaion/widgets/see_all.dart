import 'package:flutter/material.dart';

import '../../../../core/utilis/app_strings/app_strings_screen.dart';


class SeeAll extends StatelessWidget {
   final Function() onPressed;
      final String title;
  const SeeAll({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            AppStrings.seeAll,
            style: Theme.of(context).textTheme.bodyText2,

    ),
        ],
      ),
    );
  }

}
