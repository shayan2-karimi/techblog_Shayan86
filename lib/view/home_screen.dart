import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_66666/controller/home_screen_controller.dart';
import 'package:flutter_application_66666/controller/single_article_controller.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/models/fake_data.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/componet/my_string.dart';
import 'package:flutter_application_66666/view/article/article_list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.sizeCustom,
    required this.textThemeCustom,
    required this.marginCustom,
  });

  final Size sizeCustom;
  final TextTheme textThemeCustom;
  final double marginCustom;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(() {
        return homeScreenController.loading.value == false
            ? Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  posterScreen(),
                  const SizedBox(
                    height: 40,
                  ),
                  _HomePageTagList(
                      marginCustom: marginCustom,
                      textThemeCustom: textThemeCustom),
                  const SizedBox(
                    height: 40,
                  ),
                  _HomePageSeeMoreBlog(
                      marginCustom: marginCustom,
                      textThemeCustom: textThemeCustom),
                  const SizedBox(
                    height: 20,
                  ),
                  topVisited(),
                  _HomePageSeeMorePodcast(
                      marginCustom: marginCustom,
                      textThemeCustom: textThemeCustom),
                  topPodcast(),
                  const SizedBox(
                    height: 45,
                  ),
                ],
              )
            : SizedBox(
                height: Get.height,
                child: const loading(),
              );
      }),
    );
  }

  Widget posterScreen() {
    return Obx(
      () {
        return Stack(
          children: [
            Container(
              height: sizeCustom.height / 4.2,
              width: sizeCustom.width / 1.25,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: GradiantColors.posterCoverGradiant,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: homeScreenController.poster.value.image!,
                placeholder: (context, url) {
                  return const loading();
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(homeScreenController.poster.value.title!,
                      style: textThemeCustom.displayLarge),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget topVisited() {
    return Obx(
      () {
        return SizedBox(
          height: sizeCustom.height / 3.6,
          child: ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  singleArticleController.getArticle(
                      homeScreenController.topVisitedList[index].id);
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(right: index == 0 ? marginCustom : 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: index == 4 ? 10 : 0),
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
                              imageUrl: homeScreenController
                                  .topVisitedList[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                              homeScreenController
                                                  .topVisitedList[index]
                                                  .author!,
                                              style:
                                                  textThemeCustom.titleMedium),
                                          Row(
                                            children: [
                                              Text(
                                                  homeScreenController
                                                      .topVisitedList[index]
                                                      .view!,
                                                  style: textThemeCustom
                                                      .titleMedium),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              const Icon(
                                                Icons.remove_red_eye_sharp,
                                                size: 18,
                                                color: MyColors.viewsIconsColor,
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
                          homeScreenController.topVisitedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: textThemeCustom.displayMedium,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget topPodcast() {
    return Obx(
      () {
        return SizedBox(
          height: sizeCustom.height / 3.6,
          child: ListView.builder(
            itemCount: homeScreenController.topPodcastList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? marginCustom : 15,
                    left: index == 3 ? 10 : 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeCustom.height / 5.6,
                      width: sizeCustom.width / 2.4,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastList[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(17),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        placeholder: (context, url) {
                          return const SpinKitFadingCircle(
                            color: MyColors.primeryColor,
                            size: 50.0,
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      homeScreenController.topPodcastList[index].title!,
                      style: textThemeCustom.displayMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class loading extends StatelessWidget {
  const loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      color: MyColors.primeryColor,
      size: 50.0,
    );
  }
}

class _HomePageSeeMorePodcast extends StatelessWidget {
  const _HomePageSeeMorePodcast({
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
          ImageIcon(
            Assets.images.icons.microphone.provider(),
            color: MyColors.colorTitle,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            MyString.viewHotesPodcasts,
            style: textThemeCustom.displaySmall,
          ),
        ],
      ),
    );
  }
}

class _HomePageSeeMoreBlog extends StatelessWidget {
  const _HomePageSeeMoreBlog({
    required this.marginCustom,
    required this.textThemeCustom,
  });

  final double marginCustom;
  final TextTheme textThemeCustom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ArticleListScreen()),
      child: Padding(
        padding: EdgeInsets.only(right: marginCustom, bottom: 20),
        child: Row(
          children: [
            ImageIcon(
              Assets.images.icons.pencel.provider(),
              color: MyColors.colorTitle,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              MyString.viewHotesBlog,
              style: textThemeCustom.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageTagList extends StatelessWidget {
  const _HomePageTagList({
    required this.marginCustom,
    required this.textThemeCustom,
  });

  final double marginCustom;
  final TextTheme textThemeCustom;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: tagListHashCode.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.fromLTRB(0, 0, index == 0 ? marginCustom : 18, 0),
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: LinearGradient(
                  colors: GradiantColors.tags,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.images.icons.hashTag.provider(),
                      color: Colors.white,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      Get.find<HomeScreenController>().tagsList[index].title!,
                      style: textThemeCustom.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
