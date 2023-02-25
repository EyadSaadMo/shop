import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/style/colors.dart';

class MainButton extends StatelessWidget {
      final String text;
     final Function() onPressed;
     Color? textColor;

   MainButton({Key? key, required this.text, required this.onPressed,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: defaultColor,
          padding: EdgeInsets.all(20.0),
          elevation: 10,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
