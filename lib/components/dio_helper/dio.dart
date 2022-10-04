import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio,dioSMS,dioMap;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://backend-shipping.boltshipping.com/",
        receiveDataWhenStatusError: true,
      ),
    );
    dioMap=Dio(
      BaseOptions(
        baseUrl: "https://maps.googleapis.com/maps/",
        receiveDataWhenStatusError: true,
      ),
    );
    dioSMS=Dio(
      BaseOptions(
        baseUrl: "https://smssmartegypt.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required String? token,
    required String? accessToken,
    required String? authorization,
    required Map<String, dynamic> data,
  }) {
    dio!.options.headers={
      "token": token ?? "",
      "access_token": accessToken ?? "",
      "Authorization": authorization ?? "",
    };
    dio?.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
      request: true,
    ));
    return dio!.post(url, data: data);
  }

  static Future<Response> getMapData({
    required String url,
    Map<String, dynamic>? data,

  })
  {


    return  dio!.get(url,queryParameters: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    required String ? authorization,
  })
  {
    dio!.options.headers={
      "Authorization": authorization ?? "",
    };

    return  dio!.get(url,queryParameters: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.put(url,queryParameters: data);
  }

  static Future<Response> requestData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.request(url,queryParameters: data);
  }

  static clearData() {
     dio!.clear();
  }
}
