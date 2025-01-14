import 'package:flutter_application_66666/controller/article_list_controller.dart';
import 'package:flutter_application_66666/controller/manage_article_controller.dart';
import 'package:flutter_application_66666/controller/register_controller.dart';
import 'package:flutter_application_66666/controller/single_article_controller.dart';
import 'package:get/get.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleListController());
    Get.lazyPut(
      () => SingleArticleController(),
    );
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageArticleController());
  }
}
