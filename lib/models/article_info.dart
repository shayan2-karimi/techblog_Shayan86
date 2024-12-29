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
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
    required this.isFavorite,
  });

  ArticleInfo.fromJson(Map<String, dynamic> elementInfo) {
    var info = elementInfo['info'];
    id = info['id'];
    title = info['title'];
    content = info['content'];
    image = info['image'];
    catId = info['cat_id'];
    catName = info['cat_name'];
    author = info['author'];
    view = info['view'];
    status = info['status'];
    createdAt = info['created_at'];
    isFavorite = elementInfo['isFavorite'];
  }
}
