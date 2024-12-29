import 'package:flutter_application_66666/componet/myapi_constant.dart';

class TopVisited {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  // String? isFavorite;
  String? createdAt;

  TopVisited({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    //  this.isFavorite,
    required this.createdAt,
  });

  TopVisited.fromJson(Map<String, dynamic> elementVisit) {
    id = elementVisit["id"];
    title = elementVisit["title"];
    image = MyapiConstant.baseUrlImage + elementVisit["image"];
    catId = elementVisit["cat_id"];
    catName = elementVisit["cat_name"];
    author = elementVisit["author"];
    view = elementVisit["view"];
    status = elementVisit["status"];
    createdAt = elementVisit["created_at"];
  }
}
