import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/models/visited_model.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:get/get.dart';

class ArticleListController extends GetxController {
  RxList<TopVisited> articleList = RxList();

  RxBool loadingArticle = false.obs;

  @override
  void onInit() {
    getArticleList();

    super.onInit();
  }

  getArticleList() async {
    loadingArticle.value = true;
    var response = await DioServic().getMethod(MyapiUrlConstant.myArticleItem);

    if (response.statusCode == 200) {
      response.data.forEach((elementList) {
        articleList.add(TopVisited.fromJson((elementList)));
      });
    }
    loadingArticle.value = false;
  }

  getArticleListTagsId(String id) async {
    articleList.clear();
    loadingArticle.value = true;
    var response = await DioServic().getMethod(
        '${MyapiUrlConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((elementList) {
        articleList.add(TopVisited.fromJson((elementList)));
      });
    }
    loadingArticle.value = false;
  }
}
