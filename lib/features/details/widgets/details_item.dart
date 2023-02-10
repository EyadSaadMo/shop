import 'package:flutter/material.dart';

import '../../../core/style/colors.dart';
import '../../home/data/model/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
class DetailsItem extends StatelessWidget {
  ProductsModel model;
   DetailsItem({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: CachedNetworkImageProvider("${model.image}"),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '${model.name}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            '${model.price}',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: defaultColor),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Details ',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.deepOrange),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.description}',
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 15.0,
          ),
          // defaultButton(text: 'Add to Chart', function: (){}),
        ],
      ),
    );
  }

}
