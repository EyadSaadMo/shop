import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String text1;
  final String text2;
  Function()?onPressed;
   SettingItem({Key? key,required this.text1,required this.text2,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 70.0,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1,style: Theme.of(context).textTheme.bodyText1,),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  text2,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Spacer(),
                Icon(Icons.navigate_next_outlined,size: 20,),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
