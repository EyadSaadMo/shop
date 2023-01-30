
import 'package:flutter/material.dart';

Widget defaultTextButton({
  required Function function,
  @required String? text,
}) {
  return TextButton(
      onPressed: () {
        function();
      },
      child: Text(text!.toUpperCase()));
}
