import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/models/fake_data.dart';
import 'package:flutter_application_66666/my_colors.dart';
import 'package:flutter_application_66666/my_string.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MycategoryScreen extends StatefulWidget {
  const MycategoryScreen({super.key});

  @override
  State<MycategoryScreen> createState() => _MycategoryScreenState();
}

class _MycategoryScreenState extends State<MycategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var textThemeCustom = Theme.of(context).textTheme;
    var sizeCustom = MediaQuery.of(context).size;
    double marginCustom = sizeCustom.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                left: marginCustom, right: marginCustom, top: 60),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.images.w3c1.path, height: 120),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    MyString.textSvgCategory,
                    style: textThemeCustom.displayMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'نام و نام خانوداگی',
                      hintStyle: textThemeCustom.headlineSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    MyString.chooseCategory,
                    style: textThemeCustom.displayMedium,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagListHashCode.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 0.2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags
                                  .contains(tagListHashCode[index])) {
                                selectedTags.add(tagListHashCode[index]);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('این لیست رو قبلا اضافه کردین!'),
                                    backgroundColor: MyColors.primeryColor,
                                  ),
                                );
                              }
                            });
                          },
                          child: Container(
                            height: 70,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
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
                                    tagListHashCode[index].title,
                                    style: textThemeCustom.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Image.asset(Assets.images.icons.iconFlash.path, scale: 2.5),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: selectedTags.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 0.2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 70,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: MyColors.selectedTagsColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  selectedTags[index].title,
                                  style: textThemeCustom.displayMedium,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
