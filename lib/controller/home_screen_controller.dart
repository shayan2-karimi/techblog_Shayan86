import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/models/podcast_model.dart';
import 'package:flutter_application_66666/models/poster_model.dart';
import 'package:flutter_application_66666/models/tags_model.dart';
import 'package:flutter_application_66666/models/visited_model.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList<TopVisited> topVisitedList = RxList();
  RxList<TopPodcasts> topPodcastList = RxList();
  RxList<TagsModel> tagsList = RxList();

  @override
  onInit() {
    super.onInit();
    getMethodHome();
  }

  getMethodHome() async {
    var myResponse = await DioServic().getMethod(MyapiConstant.myHomeItem);

    if (myResponse.statusCode == 200) {
      myResponse.data['top_visited'].forEach((element) {
        topVisitedList.add(TopVisited.fromJson((element)));
      });
      myResponse.data['top_podcasts'].forEach((elemebtPod) {
        topPodcastList.add(TopPodcasts.fromJson((elemebtPod)));
      });
    }
  }
}
