import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as mydio_service;

class DioServic {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    try {
      var response =
          await dio.get(url, options: Options(responseType: ResponseType.json));
      print(response.data);
      return response;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String urlPost) async {
    Dio dio = Dio();
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
    });
  }
}
