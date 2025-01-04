import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/componet/my_string.dart';
import 'package:flutter_application_66666/controller/article_list_controller.dart';
import 'package:flutter_application_66666/controller/home_screen_controller.dart';
import 'package:flutter_application_66666/controller/single_article_controller.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/models/fake_data.dart';
import 'package:flutter_application_66666/view/article_list.dart';
import 'package:flutter_application_66666/view/home_screen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class Single extends StatefulWidget {
  const Single({super.key});

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  void initState() {
    super.initState();
    singleArticleController.getArticle();
  }

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var sizeCustom = MediaQuery.of(context).size;
    var textThemeCustom = Theme.of(context).textTheme;
    double marginCustom = sizeCustom.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        singleArticleController.articleInfoModel.value.image!,
                    placeholder: (context, url) {
                      return const loading();
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset("assets/images/1077804.png");
                    },
                    imageBuilder: (context, imageProvider) {
                      return Image(image: imageProvider);
                    },
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                    singleArticleController.articleInfoModel.value.title!,
                    style:
                        textThemeCustom.displayMedium!.copyWith(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, right: 20, left: 0, bottom: 60),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.images.profileAvator.path,
                      scale: 6,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(singleArticleController.articleInfoModel.value.author!,
                        style: textThemeCustom.headlineMedium!
                            .copyWith(fontSize: 17)),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      singleArticleController.articleInfoModel.value.createdAt!,
                      style: textThemeCustom.headlineMedium!
                          .copyWith(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 25, 40),
                child: HtmlWidget(
                  singleArticleController.articleInfoModel.value.content!,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      const loading(),
                ),
              ),
              //                                   لیست تگ ها
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: singleArticleController.tagsModel.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        var tagsId =
                            singleArticleController.tagsModel[index].id!;
                        await Get.find<ArticleListController>()
                            .getArticleListTagsId(tagsId);

                        Get.to(ArticleListScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: Text(
                                singleArticleController.tagsModel[index].title!,
                                style: textThemeCustom.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SeeMore(
                  marginCustom: marginCustom, textThemeCustom: textThemeCustom),
              Obx(
                () {
                  return SizedBox(
                    height: sizeCustom.height / 3.6,
                    child: ListView.builder(
                      itemCount: singleArticleController.relatedList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: index == 0 ? marginCustom : 20),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: index == 4 ? 10 : 0),
                                child: SizedBox(
                                  height: sizeCustom.height / 5.2,
                                  width: sizeCustom.width / 2.1,
                                  child: CachedNetworkImage(
                                      placeholder: (context, url) {
                                        return const loading();
                                      },
                                      errorWidget: (context, url, error) {
                                        return const Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 50,
                                          color: Colors.grey,
                                        );
                                      },
                                      imageUrl: singleArticleController
                                          .relatedList[index].image!,
                                      imageBuilder: (context, imageProvider) {
                                        return Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              foregroundDecoration:
                                                  BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                gradient: const LinearGradient(
                                                  colors: GradiantColors
                                                      .posterCoverGradiant2,
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 0,
                                              right: 0,
                                              bottom: 8,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    singleArticleController
                                                        .relatedList[index]
                                                        .author!,
                                                    style: textThemeCustom
                                                        .displayLarge,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          singleArticleController
                                                              .relatedList[
                                                                  index]
                                                              .view!,
                                                          style: textThemeCustom
                                                              .titleMedium),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .remove_red_eye_sharp,
                                                        size: 18,
                                                        color: MyColors
                                                            .viewsIconsColor,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: sizeCustom.width / 2.1,
                                child: Text(
                                  singleArticleController
                                      .relatedList[index].title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: textThemeCustom.displayMedium,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class SeeMore extends StatelessWidget {
  const SeeMore({
    super.key,
    required this.marginCustom,
    required this.textThemeCustom,
  });

  final double marginCustom;
  final TextTheme textThemeCustom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: marginCustom, bottom: 20, top: 40),
      child: Row(
        children: [
          Text(
            MyString.relatedArticle,
            style: textThemeCustom.displaySmall,
          ),
        ],
      ),
    );
  }
}
