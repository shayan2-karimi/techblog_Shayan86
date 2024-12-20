class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    required this.id,
    required this.title,
    required this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> elementPoster) {
    id = elementPoster["id"];
    title = elementPoster["title"];
    image = elementPoster["image"];
  }
}
