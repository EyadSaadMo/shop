import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  static MapCubit get(context)=>BlocProvider.of(context);
  List<Map<String, dynamic>> deliveryMethods = [
    {
      'image': 'assets/images/fadex.png',
      'title': '2-3 Days',
      'isSelected': true,
    },
    {
      'image': 'assets/images/dhl.png',
      'title': '1-3 Days',
      'isSelected': false,
    },
    {
      'image': 'assets/images/armex.png',
      'title': '2-5 Days',
      'isSelected': false,
    },
  ];
  int currentIndex = -1;
  int delivery = 15;
  LocationPermission? locationPermission ;
  GoogleMapController? googleMapController;
  Position? currentLocation;
  CameraPosition? googlePlex;
  Set<Marker> myMarker ={
    Marker(markerId: MarkerId('1'),position:LatLng(31.040720  , 31.382469)),
  };
  Future getLocation() async{
    bool service =  await Geolocator.isLocationServiceEnabled();
    if(service == false){
      print('service is error');
    }
    print( service);
  }
  Future checkPermission()async{
    locationPermission=   await Geolocator.checkPermission();
    print(locationPermission);
    if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      // Navigator.pushNamed(context, LoginScreen.routeName);
    }if(locationPermission == LocationPermission.always){
      getLatLong();
    }
  }

  Future<void> getLatLong()async{
    currentLocation= await Geolocator.getCurrentPosition();
    var lat = currentLocation!.latitude;
    var long = currentLocation!.longitude;
    googlePlex = CameraPosition(
      target: LatLng(lat  , long),
      zoom: 15.4746,
    );
    emit(MapGetLatLongSuccessState());
  }
  // if (state is SelectMethod) {
  // currentIndex = state.index;
  // switch (state.index) {
  // case 0:
  // delivery = 15;
  // break;
  // case 1:
  // delivery = 20;
  // break;
  // case 2:
  // delivery = 10;
  // break;
  // default:
  // }
  //
  // }
}
