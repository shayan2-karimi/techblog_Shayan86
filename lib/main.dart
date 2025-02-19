import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/single_manage_article.dart';
import 'package:flutter_application_66666/view/article/manage_article.dart';
import 'package:flutter_application_66666/view/main_screen.dart';
import '../../../binding.dart';
import 'package:flutter_application_66666/view/my_splashScreen.dart';
import 'package:flutter_application_66666/view/article/singleArticle.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.statusBarColorCustom,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: MyColors.systemNavigationBarColorCustom,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textThemeCustom = Theme.of(context).textTheme;
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: StrongConst.mainScreenRoute,
          page: () => MainScreen(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: StrongConst.singleScreenRoute,
          page: () => SingleArticle(),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: StrongConst.manageArticleRoute,
          page: () => ManageArticle(),
          binding: ManageArticleBinding(),
        ),
        GetPage(
          name: StrongConst.singleManageArticleRoute,
          page: () => singleManageArticle(),
          binding: ManageArticleBinding(),
        ),
      ],
      locale: const Locale('fa'),
      debugShowCheckedModeBanner: false,
      theme: lightThem(textThemeCustom),
      home: const MySplashscreen(),
    );
  }

  ThemeData lightThem(TextTheme textThemeCustom) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return textThemeCustom.displayLarge;
              }
              return textThemeCustom.titleMedium;
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return MyColors.seeMore;
            }
            return MyColors.primeryColor;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // مستطیل کامل
            ),
          ),
          minimumSize:
              WidgetStateProperty.all(const Size(160, 40)), // عرض و ارتفاع
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
                vertical: 20, horizontal: 40), // فضای داخلی
          ),
        ),
      ),
      fontFamily: 'Ubuntu',
      brightness: Brightness.light,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w700), // bodyText1
        bodyMedium: TextStyle(fontFamily: 'Ubuntu'),
        bodySmall: TextStyle(fontFamily: 'Ubuntu'),
        displayLarge: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 16,
            color: MyColors.posterTitle,
            fontWeight: FontWeight.w900), // headline1
        displayMedium: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w700), // headline2
        displaySmall: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 16,
          color: MyColors.seeMore,
          fontWeight: FontWeight.w700,
        ), // headline3
        headlineLarge: TextStyle(fontFamily: 'Ubuntu'),
        headlineMedium: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 14,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w700), // headline4
        headlineSmall: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 14,
            color: MyColors.hintTextColor,
            fontWeight: FontWeight.w700), // headline5
        titleLarge: TextStyle(fontFamily: 'Ubuntu'),
        titleMedium: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 14,
            color: MyColors.posterSubTitleColor,
            fontWeight: FontWeight.w300), // subtitle1
        titleSmall: TextStyle(fontFamily: 'Ubuntu'),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}

class StrongConst {
  static String mainScreenRoute = '/mainScreen';
  static String singleScreenRoute = '/articleScreen';
  static String manageArticleRoute = '/ManageArticle';
  static String singleManageArticleRoute = '/singleManageArticle';
}
