class MyapiUrlConstant {
  static const baseUrl = 'https://techblog.sasansafari.com/Techblog/api/';
  static const hostDiUrl = 'https://techblog.sasansafari.com';
  static const baseUrlImage = 'https://techblog.sasansafari.com';
  static const myHomeItem = '${baseUrl}home/?command=index';
  static const myArticleItem =
      '${baseUrl}article/get.php?command=new&user_id=1';
  static const myPostRegister = '${baseUrl}register/action.php';
  static const myPostArticle = '${baseUrl}article/post.php';
  static const myManageArticle =
      '${baseUrl}article/get.php?command=published_by_me&user_id=';
}

class MyApiKeyConstant {
  static const String title = 'title';
  static const String content = 'content';
  static const String catId = 'cat_id';
  static const String userId = 'user_id';
  static const String image = 'image';
  static const String command = 'cammand';
  static const String tagList = 'tag_list';
}
