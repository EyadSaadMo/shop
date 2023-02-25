// import 'package:flutter/material.dart';
// import 'package:flutter_challenges/core/style/colors.dart';
// import 'package:flutter_challenges/features/checkout/presentation/view/map_view_screen.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../../core/utilis/media_query.dart';
// import '../bloc/location_bloc.dart';
//
//
// class MapPreview extends StatelessWidget {
//   static const routeName = 'mapview';
//   // final LocationBloc bloc;
//   const MapPreview({required this.bloc});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: SizedBox(
//         height: kHeight(context) / 4,
//         width: MediaQuery.of(context).size.width,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               GoogleMap(
//                 minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
//                 mapType: MapType.normal,
//                 initialCameraPosition: bloc.initialTarget!,
//                 zoomControlsEnabled: false,
//                 compassEnabled: false,
//                 indoorViewEnabled: true,
//                 mapToolbarEnabled: false,
//               ),
//               Container(
//                   width: kWidth(context),
//                   alignment: Alignment.center,
//                   height: kHeight(context),
//                   child: const Icon(
//                     Icons.location_on,
//                     color: defaultColor,
//                     size: 35,
//                   )),
//               Positioned(
//                 bottom: 10,
//                 right: 0,
//                 child: InkWell(
//                   onTap: () {
//                     bloc.add(GetCurrentLocation());
//                   },
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     margin: const EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                     ),
//                     child: const Icon(
//                       Icons.my_location,
//                       color: defaultColor,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 right: 0,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, MapView.routeName);
//                   },
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     margin: const EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                     ),
//                     child: const Icon(
//                       Icons.fullscreen,
//                       color: defaultColor,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }