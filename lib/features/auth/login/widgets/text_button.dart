import 'package:flutter/material.dart';
class MainTextButton extends StatelessWidget {

  final Function() onPressed;
  final String text;
  const MainTextButton({Key? key, required this.onPressed,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(text));
  }
}

