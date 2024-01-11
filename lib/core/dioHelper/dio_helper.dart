import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/datasources/shared_preference.dart';
import 'package:trainee_restaurantapp/core/net/api_url.dart';

class DioHelper {
  static Dio dioSingleton = Dio()..options.baseUrl = APIUrls.new_BASE_URL;

  static Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) {
    dioSingleton.options.headers = headers;
    return dioSingleton.post(path,
        data: formData ?? body,
        options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "Authorization": AppStorage.isLogged
                  ? "Bearer ${AppStorage.getUserInfo!.result!.accessToken}"
                  : null
            }));
  }

  static Future<Response<dynamic>> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) {
    dioSingleton.options.headers = headers;
    return dioSingleton.put(path,
        data: body,
        options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "Authorization": AppStorage.isLogged
                  ? "Bearer ${AppStorage.getUserInfo!.result!.accessToken}"
                  : null
            }));
  }

  static Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? query}) async {
    dioSingleton.options.headers = headers;
    var response = await dioSingleton.get(path,
        queryParameters: query,
        options: Options(headers: {
          "Authorization": AppStorage.isLogged
              ? "Bearer ${AppStorage.getUserInfo!.result!.accessToken}"
              : null
        }));
    log("ssssssssssssssssssssssss");
    log(dioSingleton.options.baseUrl);
    log(response.toString());
    return response;
  }
  static Future<Response<dynamic>> delete(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? query}) async{
    final pref = await SpUtil.getInstance();
    final token= pref.getString(AppConstants.KEY_TOKEN);
    dioSingleton.options.headers = headers;
    return dioSingleton.delete(path,
        queryParameters: query,
        options: Options(headers: {
          "Authorization":
               "Bearer $token"
        }));
  }
}
