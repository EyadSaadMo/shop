import 'package:flutter/material.dart';
import 'package:flutter_challenges/features/checkout/presentation/cubit/map_cubit.dart';
import '../../../../core/utilis/media_query.dart';

class DeliveryMethodCard extends StatefulWidget {
  final int index;

  const DeliveryMethodCard({
    super.key,
    required this.index,
  });

  @override
  State<DeliveryMethodCard> createState() => _DeliveryMethodCardState();
}

class _DeliveryMethodCardState extends State<DeliveryMethodCard> {

  int currentIndex = 0;
  int delivery = 0;
  List<Map<String, dynamic>> deliveryMethods = [
    {
      'image': 'assets/images/fadex.png',
      'title': '2-3 Days',
    },
    {
      'image': 'assets/images/dhl.png',
      'title': '1-3 Days',
    },
    {
      'image': 'assets/images/armex.png',
      'title': '2-5 Days',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: (){
          if(deliveryMethods[widget.index]['image'] == 1){
            print(deliveryMethods[widget.index]['image']);
          }else if(deliveryMethods[widget.index]['image'] == 1){
            print(deliveryMethods[widget.index]['image']);
          }else{
            print(deliveryMethods[widget.index]['image']);
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: kElevationToShadow[4]),
          child: Column(
            children: [
              SizedBox(
                width: kWidth(context) / 2.5,
                height: kHeight(context) / 10,
                child: Image.asset(
                  deliveryMethods[widget.index]['image']!,
                  fit: BoxFit.fitWidth,
                ),
              ),
              FittedBox(child: Text(deliveryMethods[widget.index]['title']!))
            ],
          ),
        ),
      ),
      Positioned(
          right: 15,
          top: 10,
          child: currentIndex==widget.index
              ? SizedBox(
            width: 40,
            height: 30,
            child: Image.asset('assets/images/valid.png'),
          )
              : const SizedBox()),
    ]);
  }
}