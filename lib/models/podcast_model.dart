import 'package:flutter_application_66666/componet/myapi_constant.dart';

class TopPodcasts {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  TopPodcasts({
    required this.id,
    required this.title,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  TopPodcasts.fromJson(Map<String, dynamic> elemebtPod) {
    id = elemebtPod["id"];
    title = elemebtPod["title"];
    poster = MyapiUrlConstant.baseUrlImage + elemebtPod["poster"];
    catName = elemebtPod["cat_name"];
    author = elemebtPod["author"];
    view = elemebtPod["view"];
    status = elemebtPod["status"];
    createdAt = elemebtPod["created_at"];
  }
}
