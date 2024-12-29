import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/my_colors.dart';
import 'package:flutter_application_66666/componet/my_string.dart';
import 'package:flutter_application_66666/controller/home_screen_controller.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/view/home_screen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class Single extends StatelessWidget {
  Single({super.key});
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var sizeCustom = MediaQuery.of(context).size;
    var textThemeCustom = Theme.of(context).textTheme;
    double marginCustom = sizeCustom.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "",
                  placeholder: (context, url) {
                    return const loading();
                  },
                  errorWidget: (context, url, error) {
                    return Image.asset("assets/images/1077804.png");
                  },
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(17)),
                        gradient: const LinearGradient(
                          colors: GradiantColors.singleScreen,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: GradiantColors.singleScreen,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                  'رازهای اساسینز کرید والهالا؛ از هری پاتر و ارباب حلقه‌ها تا دارک سولز',
                  style: textThemeCustom.displayMedium!.copyWith(fontSize: 20)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, right: 20, left: 0, bottom: 60),
              child: Row(
                children: [
                  Image.asset(
                    Assets.images.profileAvator.path,
                    scale: 6,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('شایان کریمی',
                      style: textThemeCustom.headlineMedium!
                          .copyWith(fontSize: 17)),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '3 روز پیش',
                    style:
                        textThemeCustom.headlineMedium!.copyWith(fontSize: 17),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 25, 40),
              child: HtmlWidget(
                '''
            <h3>چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.
            
            <br> </br>


            سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.</h3>
            
            ''',
                enableCaching: true,
                onLoadingBuilder: (context, element, loadingProgress) =>
                    const loading(),
              ),
            ),
            tags(),
            SeeMore(
                marginCustom: marginCustom, textThemeCustom: textThemeCustom),
            TopVisitedSingle(
                sizeCustom: sizeCustom,
                homeScreenController: homeScreenController,
                marginCustom: marginCustom,
                textThemeCustom: textThemeCustom),
          ],
        ),
      ),
    ));
  }
}

class TopVisitedSingle extends StatelessWidget {
  const TopVisitedSingle({
    super.key,
    required this.sizeCustom,
    required this.homeScreenController,
    required this.marginCustom,
    required this.textThemeCustom,
  });

  final Size sizeCustom;
  final HomeScreenController homeScreenController;
  final double marginCustom;
  final TextTheme textThemeCustom;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SizedBox(
          height: sizeCustom.height / 3.6,
          child: ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
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
                                        colors:
                                            GradiantColors.posterCoverGradiant2,
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
                                                .topVisitedList[index].author!,
                                            style: textThemeCustom.titleMedium),
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
              );
            },
          ),
        );
      },
    );
  }
}

class SeeMore extends StatelessWidget {
  const SeeMore({
    super.key,
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
          Text(
            MyString.relatedArticle,
            style: textThemeCustom.displaySmall,
          ),
        ],
      ),
    );
  }
}

Widget tags() {
  return SizedBox(
    height: 60,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 90,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child: const Center(child: Text('Widget')),
          ),
        );
      },
    ),
  );
}
