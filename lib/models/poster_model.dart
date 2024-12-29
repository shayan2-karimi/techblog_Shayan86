import 'package:flutter_application_66666/componet/myapi_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> elementPoster) {
    id = elementPoster["id"];
    title = elementPoster["title"];
    image = MyapiConstant.baseUrlImage + elementPoster["image"];
  }
}
