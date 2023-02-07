
import 'package:flutter/material.dart';

class DefaultRectangleButton extends StatelessWidget {
  late final Size? size;
  late final Color? color;
  late final String text;
  late final IconData? icon;
  DefaultRectangleButton(
      {this.size, this.color, required this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        width: size!.width * .35,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}