import 'package:dio/dio.dart';
class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dynamic> getData({
    required String url,
    String lang = 'en',
    Map<String, dynamic>? query,
    String? token,
  }) async {
    // Map<String, String> headers = {};
    // if (token != null) {
    //   headers.addAll({'Authorization': "$token"});
    // }
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    String lang = 'en',
    Map<String, dynamic>? query,
    String? token,
   required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.put(url, queryParameters: query,data: data);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token,
    };
    return await dio.delete(
      url,
      queryParameters: query,
    );
  }
}

// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../../utilis/app_strings/app_strings_screen.dart';
//
// class HttpHelper {
//   Future<dynamic> getData({required String url,String? token,String lang = 'en',}) async {
//     Map<String, String> headers = {};
//     if (token != null) {
//       headers.addAll({'Content-Type': 'application/json',
//       'lang': lang,
//       'Authorization': token ?? '',});
//     }
//     http.Response response = await http.get(Uri.parse(url),headers: headers);
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('${AppString.apiError}${response.statusCode} with body${jsonDecode(response.body)}');
//     }
//   }
//
//   Future<dynamic> postData({
//     required String url,
//     Map<String, String>? query,
//     required Map<String, dynamic> data,
//     String lang = 'en',
//     String? token,
//   }) async {
//     if (token != null) {
//       query!.addAll({ 'Content-Type': 'application/json',
//         'lang': lang,
//         'Authorization': token ?? '',});
//     }
//     http.Response response =
//     await http.post(Uri.parse(url), body: data, headers: query);
//     if (response.statusCode == 200) {
//       // return jsonDecode(response.body);
//       Map<String,dynamic> data =  jsonDecode(response.body);
//       return data;
//     } else {
//       throw Exception('${AppString.apiError} ${response.statusCode} with body${jsonDecode(response.body)}');
//     }
//   }
//   Future<dynamic> putData({
//     required String url,
//     String lang = 'en',
//     Map<String, String>? query,
//     String? token,
//    required Map<String, dynamic> data,
//   }) async {
//     query!.addAll({
//       'Content-Type': 'application/json',
//       'lang': lang,
//       'Authorization': token ?? '',
//     });
//     if (token != null) {
//       query.addAll({'Authorization': "Bearer$token"});
//     }
//     print('url = $url body= $data token= $token ');
//     http.Response response =
//     await http.post(Uri.parse(url), body: data, headers: query);
//     if (response.statusCode == 200) {
//       // return jsonDecode(response.body);
//       Map<String,dynamic> data =  jsonDecode(response.body);
//       print(data);
//       return data;
//     } else {
//       throw Exception('${AppString.apiError} ${response.statusCode} with body${jsonDecode(response.body)}');
//     }
//   }
// }