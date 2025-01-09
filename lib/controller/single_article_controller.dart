import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/models/article_info.dart';
import 'package:flutter_application_66666/models/tags_model.dart';
import 'package:flutter_application_66666/models/visited_model.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:flutter_application_66666/view/single.dart';
import 'package:get/get.dart';

class SingleArticleController extends GetxController {
  RxBool loadingArticle = false.obs;
  RxInt id = RxInt(0);
  RxList<TagsModel> tagsModel = RxList();
  RxList<TopVisited> relatedList = RxList();

  Rx<ArticleInfo> articleInfoModel = ArticleInfo(
    id: '',
    title: '',
    content: '',
    image: '',
    catId: '',
    catName: '',
    author: '',
    view: '',
    status: '',
    createdAt: '',
    isFavorite: false,
  ).obs;

  getArticle(var id) async {
    articleInfoModel = ArticleInfo().obs;
    loadingArticle.value = true;
    var userId = '';

    var response = await DioServic().getMethod(
        '${MyapiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=1$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfo.fromJson(response.data);
      loadingArticle.value = false;
    }

    tagsModel.clear();
    response.data["tags"].forEach((element) {
      tagsModel.add(TagsModel.fromJson(element));
    });
    relatedList.clear();
    response.data["related"].forEach((element) {
      relatedList.add(TopVisited.fromJson(element));
    });

    Get.to(Single());
  }
}
