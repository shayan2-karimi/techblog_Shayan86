class TagsModel {
  String? id;
  String? title;

  TagsModel({
    required this.id,
    required this.title,
  });

  TagsModel.fromJson(Map<String, dynamic> elementTag) {
    id = elementTag["id"];
    title = elementTag["title"];
  }
}
