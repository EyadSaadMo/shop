import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String name;
  IconData? icon;
  Function()?onPressed;
   SettingItem({Key? key,required this.name,this.icon,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.deepPurple),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.deepPurple,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
