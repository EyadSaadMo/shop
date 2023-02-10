import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/screen%20size/screen_size.dart';

import '../data/model/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CategoryItem extends StatelessWidget {
  DataModel model;
   CategoryItem({required this.model,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: CachedNetworkImageProvider(
            model.image,
          ),
          width: getProportionateScreenWidth(100),
          height: getProportionateScreenHeight(120),
          fit: BoxFit.cover,
        ),
        Container(
          width: getProportionateScreenWidth(100),
          color: Colors.black.withOpacity(0.8),
          child: Text(
            model.name.toString(),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

}
