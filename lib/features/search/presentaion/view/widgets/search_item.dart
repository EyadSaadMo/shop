// import 'package:flutter/material.dart';
//
// import '../../../../../core/style/colors.dart';
// import 'package:cached_network_image/cached_network_image.dart';
//
// import '../../../../home/presentaion/cubit/cubit.dart';
// Widget buildListProduct(model, context,{bool? isOldPrice= true}) => Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Container(
//     height: 120.0,
//     child: Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(
//               image: CachedNetworkImageProvider(model.image),
//               fit: BoxFit.cover,
//               width: 120,
//               height: 120.0,
//             ),
//             if (model.discount != 0 && isOldPrice!)
//               Container(
//                 color: Colors.red,
//                 padding: EdgeInsets.symmetric(horizontal: 5.0),
//                 child: Text(
//                   'DISCOUNT',
//                   style: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 model.name.toString(),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   height: 1.4,
//                 ),
//               ),
//               Spacer(),
//               Row(
//                 children: [
//                   Text(
//                     model.price.toString(),
//                     style: TextStyle(
//                       fontSize: 13.0,
//                       color: defaultColor,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5.0,
//                   ),
//                   if (model.discount != 0 && isOldPrice!)
//                     Text(
//                       model.oldPrice.toString(),
//                       style: TextStyle(
//                           fontSize: 10.0,
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough),
//                     ),
//                   Spacer(),
//                   IconButton(
//                     onPressed: () {
//                       ShopCubit.get(context)
//                           .changeFavorites(model.id);
//                     },
//                     icon: CircleAvatar(
//                       radius: 15.0,
//                       backgroundColor: (ShopCubit.get(context).favorites[model.id])! ? defaultColor : Colors.grey,
//                       child: Icon(
//                         Icons.favorite_border,
//                         size: 14,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// );
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_challenges/features/details/data/model/products_details_model.dart';

import '../../../data/model/search_model.dart';
class SearchItem extends StatelessWidget {
  final Product model;
  const SearchItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 130.0,
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: Colors.white,
              child: Image(
                image: CachedNetworkImageProvider(model.image),
                width: 140.0,
                height: 120.0,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model.price} L.E',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            decorationStyle: TextDecorationStyle.dashed,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
