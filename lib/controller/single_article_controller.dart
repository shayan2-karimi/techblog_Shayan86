import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/models/visited_model.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:get/get.dart';

class SingleArticleController extends GetxController {
  RxBool loadingArticle = false.obs;
  RxInt id = RxInt(0);

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  getArticle() async {
    loadingArticle.value = true;
    var response = await DioServic().getMethod(MyapiConstant.myArticleItem);

    if (response.statusCode == 200) {
      response.data.forEach((elementList) {});
    }
    loadingArticle.value = false;
  }
}
