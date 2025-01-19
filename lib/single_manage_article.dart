import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/dimens.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/componet/my_componet.dart';
import 'package:flutter_application_66666/controller/file_picker_controller.dart';
import 'package:flutter_application_66666/controller/home_screen_controller.dart';
import 'package:flutter_application_66666/controller/manage_article_controller.dart';
import 'package:flutter_application_66666/services/file_picker.dart';
import 'package:flutter_application_66666/view/article_content_editor.dart';
import 'package:flutter_application_66666/view/home_screen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class singleManageArticle extends StatelessWidget {
  var manageArticleController = Get.find<ManageArticleController>();
  FilePickerController filePickerController = Get.put(FilePickerController());

  singleManageArticle({super.key});

  getTitle() {
    Get.defaultDialog(
      radius: 10,
      backgroundColor: MyColors.primeryColor,
      title: 'ویرایش عنوان مقاله',
      confirm: ElevatedButton(
          onPressed: () {
            manageArticleController.titleChange();
            Get.back();
          },
          child: const Text('ثبت')),
      content: TextField(
        controller: manageArticleController.titleTextEditingController,
        style: const TextStyle(
          color: MyColors.colorTitle,
        ),
        decoration: const InputDecoration(
          hintText: 'عنوان مقاله',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textThemeCustom = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height / 3,
                    child: filePickerController.fileMe.value.name == 'shayan'
                        ? CachedNetworkImage(
                            imageUrl: manageArticleController
                                .articleInfoSingle.value.image!,
                            placeholder: (context, url) {
                              return const Loading();
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset("assets/images/1077804.png");
                            },
                            imageBuilder: (context, imageProvider) {
                              return Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.file(
                            File(filePickerController.fileMe.value.path!),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Center(
                      child: Container(
                        width: Get.width / 3,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: MyColors.primeryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: GestureDetector(
                          onTap: () {
                            filePicker();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'انتخاب تصاویر',
                                style: textThemeCustom.displayLarge!
                                    .copyWith(fontSize: 13),
                              ),
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: GradiantColors.singleScreen,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  getTitle();
                },
                child: TitleChanges(
                  marginCustom: Dimens.marginHalfCustom,
                  textThemeCustom: textThemeCustom,
                  title: 'ویرایش عنوان مقاله',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  manageArticleController.articleInfoSingle.value.title!,
                  style: textThemeCustom.displayMedium!.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(ArticleContentEditor());
                },
                child: TitleChanges(
                  marginCustom: Dimens.marginHalfCustom,
                  textThemeCustom: textThemeCustom,
                  title: 'ویرایش متن اصلی',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 25, 40),
                child: HtmlWidget(
                  manageArticleController.articleInfoSingle.value.content!,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      const Loading(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  categorySelectBottemSheet(textThemeCustom);
                },
                child: TitleChanges(
                  marginCustom: Dimens.marginHalfCustom,
                  textThemeCustom: textThemeCustom,
                  title: 'انتخاب دسته بندی',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  manageArticleController.articleInfoSingle.value.catName ==
                          null
                      ? 'دسنه بندی خود را انتخاب کنید'
                      : manageArticleController
                          .articleInfoSingle.value.catName!,
                  style: textThemeCustom.displayMedium!.copyWith(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await manageArticleController.sendArticle();
                },
                child: Text(
                  manageArticleController.lodingM.value
                      ? 'صبر کنید...'
                      : 'ارسال مطلب',
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget tagList(TextTheme textThemeCustom) {
    var homeScreenController = Get.put(HomeScreenController());
    return SizedBox(
      height: Get.height / 2,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeScreenController.tagsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              manageArticleController.articleInfoSingle.update((value) {
                value!.catId = homeScreenController.tagsList[index].id;
                value.catName = homeScreenController.tagsList[index].title;
              });
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: MyColors.primeryColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Text(
                      homeScreenController.tagsList[index].title!,
                      style: textThemeCustom.displayLarge,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }

  categorySelectBottemSheet(TextTheme textThemeCustom) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          height: Get.height / 1.5,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'انتخاب دسته بندی',
                  style: textThemeCustom.displayMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                tagList(textThemeCustom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
