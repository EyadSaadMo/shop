import 'package:flutter/material.dart';

import '../../core/style/colors.dart';
import '../../core/utilis/screen size/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
Widget buildListCart (model ,context){
  int counter = 1;
  return  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          children: [
            Image(image: CachedNetworkImageProvider(model.image),height: getProportionateScreenHeight(150),),

            SizedBox(
                width:  SizeConfig.screenWidth * 0.09
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                      height:  getProportionateScreenHeight(15)
                  ),
                  Text(
                    'price: ${model.price}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: defaultColor),
                  ),
                  SizedBox(
                      height:  getProportionateScreenHeight(15)
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: IconButton(
                              onPressed: () {
                                  counter ==0? 0:counter--;
                              },
                              icon: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Icon(
                                  Icons.maximize_rounded,
                                  color: Colors.white,
                                ),
                              ),),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Text('$counter',style: Theme.of(context).textTheme.bodyText1,),
                          ),
                          CircleAvatar(
                            radius: 20,
                            child: IconButton(
                                onPressed: () {
                                    counter++;
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text('SubTotal',style: Theme.of(context).textTheme.bodyText2,),
              Spacer(),
              Text('${model.price}',style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
        ),
        Divider(height: 1,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text('Total',style: Theme.of(context).textTheme.bodyText1,),
              Spacer(),
              Text('${model.price*counter}',style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
        ),

      ],
    ),
  );
}