import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:flutter_application_66666/componet/commands.dart';
import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/componet/storage_cont.dart';
import 'package:flutter_application_66666/controller/file_picker_controller.dart';
import 'package:flutter_application_66666/models/article_info.dart';
import 'package:flutter_application_66666/models/tags_model.dart';
import 'package:flutter_application_66666/models/visited_model.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManageArticleController extends GetxController {
  RxBool lodingM = false.obs;
  RxList<TopVisited> manageArticle = RxList.empty();
  TextEditingController titleTextEditingController = TextEditingController();
  Rx<ArticleInfo> articleInfoSingle = ArticleInfo(
    title: 'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
    content:
        'من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی',
    image: '',
  ).obs;
  RxList<TagsModel> tagsModel = RxList.empty();

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    lodingM.value = true;

    var response =
        await DioServic().getMethod('${MyapiUrlConstant.myManageArticle}1');

    if (response.statusCode == 200) {
      response.data.forEach((elementList) {
        manageArticle.add(TopVisited.fromJson((elementList)));
      });
      lodingM.value = false;
    }
  }

  titleChange() {
    articleInfoSingle.update((value) {
      value!.title = titleTextEditingController.text;
    });
  }

  sendArticle() async {
    var fileController = Get.find<FilePickerController>();
    lodingM.value = true;
    Map<String, dynamic> mapC = {
      MyApiKeyConstant.title: articleInfoSingle.value.title,
      MyApiKeyConstant.content: articleInfoSingle.value.content,
      MyApiKeyConstant.catId: articleInfoSingle.value.catId,
      MyApiKeyConstant.userId: GetStorage().read(StorageCont.userId),
      MyApiKeyConstant.image:
          dio.MultipartFile.fromFile(fileController.fileMe.value.path!),
      MyApiKeyConstant.command: Commands.store,
      MyApiKeyConstant.tagList: '[]',
    };

    var response =
        await DioServic().postMethod(mapC, MyapiUrlConstant.myPostArticle);
    log(response.data.toString());
    lodingM.value = false;
  }
}
