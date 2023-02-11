import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
      final String label;
     final Function() onPressed;
     Color? textColor;
  Color? buttonColor;

   MainButton({Key? key, required this.label, required this.onPressed,this.textColor,this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          padding: EdgeInsets.all(20.0),
          elevation: 10,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

  }
}
