import 'package:dio/dio.dart';

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
}
