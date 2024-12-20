import 'package:url_launcher/url_launcher.dart';

Future<void> myLucherUrl(String url) async {
  final Uri myUrl = Uri.parse(url);

  if (await canLaunchUrl(myUrl)) {
    await launchUrl(myUrl, mode: LaunchMode.externalApplication);
  } else {
    print('Cannot launch $url');
  }
}
