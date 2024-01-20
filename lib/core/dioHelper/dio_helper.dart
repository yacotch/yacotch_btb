import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/datasources/shared_preference.dart';
import 'package:trainee_restaurantapp/core/net/api_url.dart';

class DioHelper {
  static Dio dioSingleton = Dio()..options.baseUrl = APIUrls.new_BASE_URL;
  DioHelper() {
    dioSingleton
      ..options
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // print request data
          print("Data: ${options.data}");
          print("Request: ${options.method} ${options.path}");
          print("Headers: ${options.headers}");
          print("Quiries: ${options.queryParameters}");
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          print("object : $response");
          // print response data
          print("Response: ${response.statusCode} ${response.data}");
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          // print error
          print("object  Error: ${e.response}");
          print("Error: ${e}");

          print("Error: ${e.message}");

          print("Error: ${e.response?.statusCode} ${e.response?.data}");
          return handler.next(e); //continue
        },
      ));
  }
  static Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) {
    log("${AppStorage.isLogged ? "Bearer ${AppStorage.getUserInfo!.result!.accessToken}" : null}");
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
      {Map<String, dynamic>? headers, Map<String, dynamic>? query}) async {
    final pref = await SpUtil.getInstance();
    final token = pref.getString(AppConstants.KEY_TOKEN);
    dioSingleton.options.headers = headers;
    print(path + "$query");
    return dioSingleton.delete(path,
        queryParameters: query,
        options: Options(headers: {"Authorization": "Bearer $token"}));
  }
}
