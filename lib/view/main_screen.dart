import 'package:flutter/material.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/my_colors.dart';
import 'package:flutter_application_66666/view/home_screen.dart';
import 'package:flutter_application_66666/view/profile_screen.dart';
import 'package:flutter_application_66666/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

var selectedTapIndex = 0;

final GlobalKey<ScaffoldState> _keyCustom = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var sizeCustom = MediaQuery.of(context).size;
    var textThemeCustom = Theme.of(context).textTheme;
    double marginCustom = sizeCustom.width / 10;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.scafoldBG,
        key: _keyCustom,
        drawer: Drawer(
          clipBehavior: Clip.none,
          child: Container(
            decoration: const BoxDecoration(
              color: MyColors.scafoldBG, // تنظیم رنگ پس‌زمینه
            ),
            child: Padding(
              padding: EdgeInsets.only(left: marginCustom, right: marginCustom),
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
                    onTap: () {},
                  ),
                  const Divider(
                    color: MyColors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      'تک‌بلاگ در گیت هاب',
                      style: textThemeCustom.headlineMedium,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.scafoldBG,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      _keyCustom.currentState!.openDrawer();
                    },
                    child: const Icon(Icons.menu)),
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
              child: IndexedStack(
                index: selectedTapIndex,
                children: [
                  HomeScreen(
                    sizeCustom: sizeCustom,
                    textThemeCustom: textThemeCustom,
                    marginCustom: marginCustom,
                  ),
                  ProfileScreen(
                      sizeCustom: sizeCustom,
                      textThemeCustom: textThemeCustom,
                      marginCustom: marginCustom),
                  const RegisterIntro()
                ],
              ),
            ),
            BottomNavigation(
              sizeCustom: sizeCustom,
              marginCustom: marginCustom,
              changeScreenPage: (int value) {
                setState(() {
                  selectedTapIndex = value;
                });
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
                    changeScreenPage(2);
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
