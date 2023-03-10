import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class BuildCategoryItem extends StatelessWidget {
  final String image;
  final String name;
  const BuildCategoryItem({Key? key, required this.image, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.0,
      width: 90.0,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.cover,
                height: 80.0,
                width: 80.0,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: Text(
              name,
         style:Theme.of(context).textTheme.bodyText1,
    overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
