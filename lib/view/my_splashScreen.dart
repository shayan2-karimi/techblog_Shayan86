// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/view/main_screen.dart';
import 'package:flutter_application_66666/my_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MySplashscreen extends StatefulWidget {
  const MySplashscreen({super.key});

  @override
  State<MySplashscreen> createState() => _MySplashscreenState();
}

class _MySplashscreenState extends State<MySplashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: Assets.images.logoTech.provider(),
                width: 125,
              ),
              const SizedBox(
                height: 15,
              ),
              const SpinKitFadingCube(
                color: MyColors.primeryColor,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
