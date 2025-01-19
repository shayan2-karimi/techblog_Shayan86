import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/my_componet.dart';
import 'package:flutter_application_66666/controller/article_list_controller.dart';
import 'package:flutter_application_66666/controller/single_article_controller.dart';
import 'package:flutter_application_66666/main.dart';
import 'package:flutter_application_66666/view/home_screen.dart';

import 'package:get/get.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListController articleListController =
      Get.put(ArticleListController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeCustom = MediaQuery.of(context).size;
    var textThemeCustom = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBarMe('مقالات جدید'),
        body: Obx(
          () => articleListController.articleList.isNotEmpty
              ? SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: articleListController.articleList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          singleArticleController.getArticle(
                              articleListController.articleList[index].id);

                          Get.toNamed(StrongConst.singleScreenRoute);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              SizedBox(
                                height: sizeCustom.height / 6,
                                width: sizeCustom.width / 3,
                                child: CachedNetworkImage(
                                  imageUrl: articleListController
                                      .articleList[index].image!,
                                  placeholder: (context, url) {
                                    return const Loading();
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 50,
                                      color: Colors.grey,
                                    );
                                  },
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(17)),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: sizeCustom.width / 2,
                                      child: Text(
                                        articleListController
                                            .articleList[index].title!,
                                        style: textThemeCustom.displayMedium,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          articleListController
                                              .articleList[index].author!,
                                          style: textThemeCustom.displayLarge,
                                        ),
                                        Text(
                                          '${articleListController.articleList[index].view!}بازدید',
                                          style: textThemeCustom.headlineMedium!
                                              .copyWith(fontSize: 13),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          articleListController
                                              .articleList[index].catName!,
                                          style: textThemeCustom.displayLarge,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Loading(),
        ),
      ),
    );
  }
}
