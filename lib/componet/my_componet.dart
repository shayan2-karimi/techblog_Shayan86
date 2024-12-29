import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';

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
                'مقالات جدید',
                style: appBarThemeText,
              ),
            ),
          ),
        ],
        leading: Padding(
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
  );
}
