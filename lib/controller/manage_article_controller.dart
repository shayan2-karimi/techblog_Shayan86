import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/componet/storage_cont.dart';
import 'package:flutter_application_66666/main.dart';
import 'package:flutter_application_66666/models/visited_model.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManageArticleController extends GetxController {
  RxList<TopVisited> manageArticle = RxList.empty();

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    // var response = await DioServic().getMethod(
    //     MyapiConstant.myManageArticle + GetStorage().read(StorageCont.userId));
    var response =
        await DioServic().getMethod(MyapiConstant.myManageArticle + '1');

    if (response.statusCode == 200) {
      response.data.forEach((elementList) {
        manageArticle.add(TopVisited.fromJson((elementList)));
      });
      // manageArticle.clear();
    }
  }
}
