import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/style/colors.dart';
import '../../../core/utilis/screen size/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../home/presentaion/cubit/cubit.dart';
import '../../home/presentaion/cubit/states.dart';

class CartItem extends StatefulWidget {
  dynamic model;
   CartItem({Key? key,required this.model}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = ShopCubit.get(context);
    // Product model = ModalRoute.of(context)!.settings.arguments as Product;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Image(image: CachedNetworkImageProvider(widget.model.image),height: getProportionateScreenHeight(150),)),
              SizedBox(
                  width:  SizeConfig.screenWidth * 0.09
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.name,
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                        height:  getProportionateScreenHeight(15)
                    ),
                    Text(
                      'price: ${widget.model.price}',
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
                                  setState(() {
                                    cubit.counter ==0? 0:cubit.counter--;
                                  });
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
                              icon: Text('${cubit.counter}',style: Theme.of(context).textTheme.bodyText1,),
                            ),
                            CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cubit.counter++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     ShopCubit.get(context)
                    //         .addOrDeleteCartItem(model.id);
                    //   },
                    //   icon: CircleAvatar(
                    //     radius: 15.0,
                    //     backgroundColor: ShopCubit.get(context).cart[model.id] ? defaultColor : Colors.grey,
                    //     child: Icon(
                    //       Icons.favorite_border,
                    //       size: 14,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),
            ],
          ),
          // Expanded(child: SizedBox()),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Row(
          //     children: [
          //       Text('SubTotal',style: Theme.of(context).textTheme.bodyText2,),
          //       Spacer(),
          //       Text('${widget.model.price}',style: Theme.of(context).textTheme.bodyText1,),
          //     ],
          //   ),
          // ),
          // Divider(height: 1,),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Row(
          //     children: [
          //       Text('Total',style: Theme.of(context).textTheme.bodyText1,),
          //       Spacer(),
          //       Text('${widget.model.price*cubit.counter}',style: Theme.of(context).textTheme.bodyText1,),
          //     ],
          //   ),
          // ),

        ],
      ),
    );
  },
);

  }
}

