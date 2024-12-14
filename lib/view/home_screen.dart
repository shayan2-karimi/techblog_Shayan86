import 'package:flutter/material.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/models/fake_data.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/componet/my_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          _HomePagePostScreen(
              sizeCustom: sizeCustom, textThemeCustom: textThemeCustom),
          const SizedBox(
            height: 40,
          ),
          _HomePageTagList(
              marginCustom: marginCustom, textThemeCustom: textThemeCustom),
          const SizedBox(
            height: 40,
          ),
          _HomePageSeeMoreBlog(
              marginCustom: marginCustom, textThemeCustom: textThemeCustom),
          const SizedBox(
            height: 20,
          ),
          _HomePageBlogList(
              sizeCustom: sizeCustom,
              marginCustom: marginCustom,
              textThemeCustom: textThemeCustom),
          _HomePageSeeMorePodcast(
              marginCustom: marginCustom, textThemeCustom: textThemeCustom),
          _HomePagePodcastList(
              sizeCustom: sizeCustom,
              marginCustom: marginCustom,
              textThemeCustom: textThemeCustom),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}

class _HomePagePodcastList extends StatelessWidget {
  const _HomePagePodcastList({
    required this.sizeCustom,
    required this.marginCustom,
    required this.textThemeCustom,
  });

  final Size sizeCustom;
  final double marginCustom;
  final TextTheme textThemeCustom;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeCustom.height / 3.6,
      child: ListView.builder(
        itemCount: blogListPodcast.getRange(0, 4).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? marginCustom : 15,
                left: index == 3 ? 10 : 0),
            child: Column(
              children: [
                Container(
                  height: sizeCustom.height / 5.6,
                  width: sizeCustom.width / 2.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(blogListPodcast[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  blogListPodcast[index].title,
                  style: textThemeCustom.displayMedium,
                )
              ],
            ),
          );
        },
      ),
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

class _HomePageBlogList extends StatelessWidget {
  const _HomePageBlogList({
    required this.sizeCustom,
    required this.marginCustom,
    required this.textThemeCustom,
  });

  final Size sizeCustom;
  final double marginCustom;
  final TextTheme textThemeCustom;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeCustom.height / 3.6,
      child: ListView.builder(
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? marginCustom : 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: index == 4 ? 10 : 0),
                  child: SizedBox(
                    height: sizeCustom.height / 5.2,
                    width: sizeCustom.width / 2.1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: GradiantColors.posterCoverGradiant2,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(blogList[index].writer,
                                  style: textThemeCustom.titleMedium),
                              Row(
                                children: [
                                  Text(blogList[index].views,
                                      style: textThemeCustom.titleMedium),
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
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: sizeCustom.width / 2.1,
                  child: Text(
                    blogList[index].title,
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
            MyString.viewHotesBlog,
            style: textThemeCustom.displaySmall,
          ),
        ],
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
    );
  }
}

class _HomePagePostScreen extends StatelessWidget {
  const _HomePagePostScreen({
    required this.sizeCustom,
    required this.textThemeCustom,
  });

  final Size sizeCustom;
  final TextTheme textThemeCustom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: sizeCustom.height / 4.2,
          width: sizeCustom.width / 1.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(homePageposterMap["imageAssets"]),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: GradiantColors.posterCoverGradiant,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      homePageposterMap["writer"] +
                          " - " +
                          homePageposterMap["date"],
                      style: textThemeCustom.titleMedium),
                  Row(
                    children: [
                      Text(homePageposterMap["view"],
                          style: textThemeCustom.titleMedium),
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
              const SizedBox(
                height: 8,
              ),
              Text(homePageposterMap["title"],
                  style: textThemeCustom.displayLarge),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
