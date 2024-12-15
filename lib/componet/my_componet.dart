import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

myLucherUrl(String url) async {
  var myUrl = Uri.parse(url);

  if (await canLaunchUrl(myUrl)) {
    await launchUrl(myUrl);
  } else {
    log('can not lunch ${myUrl.toString()}');
  }
}
