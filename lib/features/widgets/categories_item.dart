import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/screen%20size/screen_size.dart';
import '../domain/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CategoriesItems extends StatelessWidget {
  DataModel model;
  CategoriesItems({required this.model,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: CachedNetworkImageProvider(model.image),
            width: getProportionateScreenHeight(80),
            height: getProportionateScreenWidth(80),
            fit: BoxFit.cover,
          ),
          SizedBox(
              width: getProportionateScreenWidth(20)
          ),
          Text(
            model.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.navigate_next_sharp),
        ],
      ),
    );
  }

}
