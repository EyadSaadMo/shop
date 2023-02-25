import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/remote/end_points.dart';
import '../model/place_deatils_model.dart';
import '../model/suggestion_model.dart';

abstract class PlacesDataSource {
  Future<List<Suggestion>> fetchSuggestions(
      String query,
      BuildContext context,
      );
  Future<PlaceDetail> getPlaceDetailFromId(
      String placeId,
      BuildContext context,
      );
}

class PlacesDatasourceImpl implements PlacesDataSource {
  static String sessionToken = '';
  static String apiKey = 'AIzaSyAmvScp6-pEERvH5CjkLJwQG7cxUh30Vno';
  final dio = Dio();

  @override
  Future<List<Suggestion>> fetchSuggestions(
      String query, BuildContext context) async {
    final response = await dio.get(
        '$placesAutocompeleteUrlPath?input=$query&sessiontoken=$sessionToken&types=establishment&language=ar|en&key=$apiKey');

    return PlacesModel.fromJson(response.data).suggestions;
  }

  @override
  Future<PlaceDetail> getPlaceDetailFromId(
      String placeId, BuildContext context) async {
    final response = await dio.get(
        '$placesUrlPath?place_id=$placeId&fields=geometry&key=$apiKey&sessiontoken=$sessionToken');

    return PlaceDetail.fromJson(response.data);
  }
}