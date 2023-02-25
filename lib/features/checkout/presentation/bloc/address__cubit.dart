import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/network/networkInfo.dart';
import '../../data/dataSource/placeApi.dart';
import '../../data/model/place_deatils_model.dart';
import '../../data/model/suggestion_model.dart';
import 'address__state.dart';


class AddressCubit extends Cubit<AddressState> {
  final NetworkInfo networkInfo;
  LatLng? location;
  final PlacesDataSource placesDataSource;
  AddressCubit(this.networkInfo, this.placesDataSource)
      : super(AddressInitial());

  Future<List<Suggestion>> searchLocation(
      String query, BuildContext context) async {
    emit(SearchListLoadingState());
    final data = await placesDataSource.fetchSuggestions(query, context);
    emit(SearchListLoadedState(places: data));

    return data;
  }

  Future<PlaceDetail> getLocation(
      String placeId,
      BuildContext context,
      ) async {
    emit(GetLocationLoadingState());
    final data = await placesDataSource.getPlaceDetailFromId(placeId, context);
    location = LatLng(
        data.result.geometry.location.lat, data.result.geometry.location.lng);
    emit(GetLocationLoadedState(location: data));

    return data;
  }
}
