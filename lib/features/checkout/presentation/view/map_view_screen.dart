import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/map_cubit.dart';
class MapView extends StatefulWidget {
  static const routeName = 'map_view';
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}


class _MapViewState extends State<MapView> {
  TextEditingController textController = TextEditingController();


  @override
  void initState() {
    var cubit = MapCubit.get(context);

    super.initState();
    cubit.checkPermission();
   cubit. getLatLong();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
        MapCubit, MapState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = MapCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.selectNewAddress,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body:
      cubit.googlePlex==null?Center(child: CircularProgressIndicator()):
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                child:  GoogleMap(
                  markers: cubit.myMarker,
                  mapType: MapType.normal,
                  initialCameraPosition:cubit.googlePlex!,
                  onTap: (latlong){
                    cubit.myMarker.remove(Marker(markerId: MarkerId('1')));
                    cubit.myMarker.add(Marker(markerId: MarkerId('1'),position: latlong));
                    setState(() {

                    });
                  },
                  onMapCreated: (GoogleMapController controller) {
                    cubit.googleMapController = controller;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (String? value){
                     return '';
                    },
                    controller: textController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          const BorderSide(color: Colors.transparent)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          const BorderSide(color: Colors.transparent)),
                      hintText: 'search',
                      hintStyle: const TextStyle(
                        color: Color(0xFF535353),
                      ),
                      suffixIcon: const SizedBox(),
                    ),
                  ),
                ),
              ),

            ],
          )
    );
  },
);
  }
}
