// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/my_componet.dart';
import 'package:flutter_application_66666/controller/manage_article_controller.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/componet/my_string.dart';
import 'package:flutter_application_66666/main.dart';
import 'package:flutter_application_66666/view/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var manageArticleState = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textThemeCustom = Theme.of(context).textTheme;
    var sizeCustom = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: appBarMe('مدیریت مقاله ها'),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(StrongConst.singleManageArticleRoute);
            },
            child: const Text(
              'بریم برای نوشتن یه مقاله باحال',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Obx(
          () => manageArticleState.lodingM.value
              ? const Loading()
              : manageArticleState.manageArticle.isNotEmpty
                  ? SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: manageArticleState.manageArticle.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              //TODO go to singlr manage
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: sizeCustom.height / 6,
                                    width: sizeCustom.width / 3,
                                    child: CachedNetworkImage(
                                      imageUrl: manageArticleState
                                          .manageArticle[index].image!,
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
                                            borderRadius:
                                                const BorderRadius.all(
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
                                            manageArticleState
                                                .manageArticle[index].title!,
                                            style:
                                                textThemeCustom.displayMedium,
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
                                              manageArticleState
                                                  .manageArticle[index].author!,
                                              style:
                                                  textThemeCustom.displayLarge,
                                            ),
                                            Text(
                                              '${manageArticleState.manageArticle[index].view!}بازدید',
                                              style: textThemeCustom
                                                  .headlineMedium!
                                                  .copyWith(fontSize: 13),
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Text(
                                              manageArticleState
                                                  .manageArticle[index]
                                                  .catName!,
                                              style:
                                                  textThemeCustom.displayLarge,
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
                  : articleEmptyState(textThemeCustom),
        ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textThemeCustom) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.w3c2.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: MyString.manageArticleText,
                style: textThemeCustom.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
