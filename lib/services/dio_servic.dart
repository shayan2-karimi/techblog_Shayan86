// ignore_for_file: body_might_complete_normally_catch_error

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as mydio_service;

class DioServic {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';

    return await dio
        .get(url, options: Options(responseType: ResponseType.json))
        .then((onValue) {
      print(onValue.headers.toString());
      print(onValue.data.toString());
      print(onValue.statusCode.toString());
      return onValue;
    }).catchError((err) {
      if (err is DioException) {
        return err.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String urlPost) async {
    dio.options.headers['content-type'] = 'application/json';
    // TODO برای دریافت توکن هست
    return await dio
        .post(urlPost,
            data: mydio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((onValue) {
      print(onValue.headers.toString());
      print(onValue.data.toString());
      print(onValue.statusCode.toString());
      return onValue;
    }).catchError((err) {
      if (err is DioException) {
        return err.response!;
      }
    });
  }
}
