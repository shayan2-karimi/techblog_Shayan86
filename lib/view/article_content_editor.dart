import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/my_componet.dart';
import 'package:flutter_application_66666/controller/manage_article_controller.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});
  final HtmlEditorController controllerHtml = HtmlEditorController();
  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controllerHtml.clearFocus();
      },
      child: Scaffold(
        appBar: appBarMe('ویرایش متن مقاله'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controllerHtml,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'متن را اینجا وارد کنید',
                  shouldEnsureVisible: true,
                  initialText:
                      manageArticleController.articleInfoSingle.value.content,
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoSingle.update((val) {
                      val!.content = p0;
                    });
                    debugPrint(manageArticleController
                        .articleInfoSingle.value.content);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
