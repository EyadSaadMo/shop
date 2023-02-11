import 'package:flutter/material.dart';

class AddedToCart extends StatelessWidget {
  double? size = double.infinity;
      final String label;
        Function()? onPressed;
   AddedToCart({Key? key, required this.label, this.size,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          elevation: 10,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
  }


