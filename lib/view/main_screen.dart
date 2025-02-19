import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/dimens.dart';
import 'package:flutter_application_66666/componet/my_url_github.dart';
import 'package:flutter_application_66666/componet/my_string.dart';
import 'package:flutter_application_66666/controller/register_controller.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/view/home_screen.dart';

import 'package:flutter_application_66666/view/profile_screen.dart';
import 'package:flutter_application_66666/view/register/register_intro.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

// final GlobalKey<ScaffoldState> _keyCustom = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedTapIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeCustom = MediaQuery.of(context).size;
    var textThemeCustom = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.scafoldBG,
        // key: _keyCustom,
        drawer: Drawer(
          clipBehavior: Clip.none,
          child: Container(
            decoration: const BoxDecoration(
              color: MyColors.scafoldBG, // تنظیم رنگ پس‌زمینه
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimens.marginCustom, right: Dimens.marginCustom),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset(Assets.images.logoTech.path, scale: 3),
                  ),
                  ListTile(
                    title: Text(
                      'پروفایل کاربری',
                      style: textThemeCustom.headlineMedium,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: MyColors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      'درباره تک‌بلاگ',
                      style: textThemeCustom.headlineMedium,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: MyColors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      'اشتراک گذاری تک بلاگ',
                      style: textThemeCustom.headlineMedium,
                    ),
                    onTap: () async {
                      await Share.share(
                          'بااشتراک گذاشتن تک بلاگ دوستان خود را هم خوشحال کنید');
                    },
                  ),
                  const Divider(
                    color: MyColors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      'تک‌بلاگ در گیت هاب',
                      style: textThemeCustom.headlineMedium,
                    ),
                    onTap: () {
                      myLucherUrl(MyString.mylaucherUrlgithub);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // InkWell(
                //     onTap: () {
                //       _keyCustom.currentState!.openDrawer();
                //     },
                //     child: const Icon(Icons.menu)),
                Image(
                  image: Assets.images.logoTech.provider(),
                  height: sizeCustom.height / 13.6,
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(
                () {
                  return IndexedStack(
                    index: selectedTapIndex.value,
                    children: [
                      HomeScreen(
                        sizeCustom: sizeCustom,
                        textThemeCustom: textThemeCustom,
                        marginCustom: Dimens.marginCustom,
                      ),
                      ProfileScreen(
                          sizeCustom: sizeCustom,
                          textThemeCustom: textThemeCustom,
                          marginCustom: Dimens.marginCustom),
                      RegisterIntro()
                    ],
                  );
                },
              ),
            ),
            BottomNavigation(
              sizeCustom: sizeCustom,
              marginCustom: Dimens.marginCustom,
              changeScreenPage: (int value) {
                selectedTapIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.sizeCustom,
    required this.marginCustom,
    required this.changeScreenPage,
  });
  final Size sizeCustom;
  final double marginCustom;
  final Function(int) changeScreenPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: sizeCustom.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBackground,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(marginCustom, 10, marginCustom, 10),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(
                colors: GradiantColors.bottomNav,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    changeScreenPage(0);
                  },
                  icon: ImageIcon(
                    Assets.images.icons.icon.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.find<RegisterController>().isLogin();
                  },
                  icon: ImageIcon(
                    Assets.images.icons.w.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    changeScreenPage(1);
                  },
                  icon: ImageIcon(
                    Assets.images.icons.user.provider(),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
