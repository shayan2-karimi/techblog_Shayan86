import 'package:flutter_application_66666/componet/myapi_constant.dart';

class ArticleInfo {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  ArticleInfo({
    this.title,
    this.content,
    this.image,
  });

  ArticleInfo.fromJson(Map<String, dynamic> elementInfo) {
    var info = elementInfo['info'] ?? {};
    id = info['id'] ?? '';
    title = info['title'] ?? '';
    content = info['content'] ?? '';
    image =
        info['image'] != null ? MyapiUrlConstant.hostDiUrl + info['image'] : '';
    catId = info['cat_id'] ?? '';
    catName = info['cat_name'] ?? '';
    author = info['author'] ?? '';
    view = info['view'] ?? '';
    status = info['status'] ?? '';
    createdAt = info['created_at'] ?? '';
    isFavorite = elementInfo['isFavorite'] ?? false;
  }
}
