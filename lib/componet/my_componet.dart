import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/view/article/article_list.dart';
import 'package:get/get.dart';

TextStyle appBarThemeText = const TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 22,
    color: MyColors.primeryColor,
    fontWeight: FontWeight.w300);

PreferredSize appBarMe(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(90),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: appBarThemeText,
              ),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.primeryColor,
              ),
              child: const Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class HomePageSeeMoreBlog extends StatelessWidget {
  const HomePageSeeMoreBlog({
    super.key,
    required this.marginCustom,
    required this.textThemeCustom,
    required this.title,
  });

  final double marginCustom;
  final TextTheme textThemeCustom;
  final String title;

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
              title,
              style: textThemeCustom.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class TitleChanges extends StatelessWidget {
  const TitleChanges({
    super.key,
    required this.marginCustom,
    required this.textThemeCustom,
    required this.title,
  });

  final double marginCustom;
  final TextTheme textThemeCustom;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            title,
            style: textThemeCustom.displaySmall,
          ),
        ],
      ),
    );
  }
}
