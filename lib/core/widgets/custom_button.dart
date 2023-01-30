import 'package:flutter/material.dart';

Widget defaultButton({
  @required String? text,
  bool isUppercase = true,
  required Function function,
}) =>
    Container(
      height: 40.0,
      width: double.infinity,
      child: MaterialButton(
        color: Colors.blue,
        onPressed: () {
          function();
        },
        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );