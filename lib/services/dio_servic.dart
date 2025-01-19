// ignore_for_file: body_might_complete_normally_catch_error

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as mydio_service;
import 'package:flutter_application_66666/componet/storage_cont.dart';
import 'package:get_storage/get_storage.dart';

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
    var tokenC = GetStorage().read(StorageCont.token);
    if (tokenC != null) {
      dio.options.headers['authoration'] = '$tokenC';
    }
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
