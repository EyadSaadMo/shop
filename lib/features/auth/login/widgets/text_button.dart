
import 'package:flutter/material.dart';
class MainTextButton extends StatelessWidget {

  final Function() function;
  final String? text;
  const MainTextButton({Key? key, required this.function, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          function();
        },
        child: Text(text!.toUpperCase()));
  }
}

