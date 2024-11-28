import 'package:flutter/material.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/my_colors.dart';
import 'package:flutter_application_66666/my_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.sizeCustom,
    required this.textThemeCustom,
    required this.marginCustom,
  });

  final Size sizeCustom;
  final TextTheme textThemeCustom;
  final double marginCustom;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: Assets.images.profileAvator.provider(),
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      Assets.images.icons.pencel.provider(),
                      color: MyColors.colorTitle,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      MyString.textEditeProfile,
                      style: textThemeCustom.displaySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'شایان کریمی',
                  style: textThemeCustom.displayMedium!
                      .copyWith(fontSize: 18, color: MyColors.primeryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'shayankarimi.8898@gmail.com',
                  style: textThemeCustom.displayMedium,
                ),
                const SizedBox(
                  height: 45,
                ),
                _TechDivider(sizeCustom: sizeCustom),
                InkWell(
                  splashColor: MyColors.primeryColor,
                  onTap: () {},
                  child: SizedBox(
                    height: 50,
                    child: Center(
                        child: Text(
                      MyString.myFavBlog,
                      style: textThemeCustom.displayMedium,
                    )),
                  ),
                ),
                _TechDivider(sizeCustom: sizeCustom),
                InkWell(
                  onTap: () {},
                  splashColor: MyColors.primeryColor,
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(MyString.myFavPadcast,
                          style: textThemeCustom.displayMedium),
                    ),
                  ),
                ),
                _TechDivider(sizeCustom: sizeCustom),
                InkWell(
                  onTap: () {},
                  splashColor: MyColors.primeryColor,
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(MyString.logOut,
                          style: textThemeCustom.displayMedium),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 110,
          ),
        ],
      ),
    );
  }
}

class _TechDivider extends StatelessWidget {
  const _TechDivider({
    required this.sizeCustom,
  });

  final Size sizeCustom;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.6,
      indent: sizeCustom.width / 6,
      endIndent: sizeCustom.width / 6,
      color: MyColors.dividerColor,
    );
  }
}
