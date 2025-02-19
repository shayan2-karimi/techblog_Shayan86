import 'package:flutter/material.dart';
import 'package:flutter_application_66666/controller/register_controller.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/componet/my_string.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});

  RegisterController registerScreenBinding = Get.put(RegisterController());

  // var registerScreenBinding = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textThemeCustom = Theme.of(context).textTheme;
    var sizeCustom = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.w3c1.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyString.welcomeText,
                    style: textThemeCustom.displayMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailButtonSheet(context, sizeCustom, textThemeCustom);
                  },
                  child: const Text(
                    'بزن بریم',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailButtonSheet(
      BuildContext context, Size sizeCustom, TextTheme textThemeCustom) {
    return showModalBottomSheet(
      isScrollControlled: true, //  جلوگیری از خطای اور فلو
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom), // برای پایین نموندن صفحه هنگام باز شدن کیبورد
          child: Container(
            height: sizeCustom.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyString.enterUserName,
                    style: textThemeCustom.headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(55, 30, 55, 40),
                    child: TextField(
                      controller:
                          registerScreenBinding.emailTextEditingController,
                      style: textThemeCustom.headlineMedium,
                      onChanged: (value) {
                        print("${value}is Email : ${isEmail(value)}");
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '******',
                        hintStyle: textThemeCustom.headlineSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      registerScreenBinding.registerCustom();
                      Navigator.pop(context);
                      _activeCodeButtonSheet(
                          context, sizeCustom, textThemeCustom);
                    },
                    child: const Text(
                      'ادامه',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activeCodeButtonSheet(
      BuildContext context, Size sizeCustom, TextTheme textThemeCustom) {
    return showModalBottomSheet(
      isScrollControlled: true, //  جلوگیری از خطای اور فلو
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom), // برای پایین نموندن صفحه هنگام باز شدن کیبورد
          child: Container(
            height: sizeCustom.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyString.enterActiveCode,
                    style: textThemeCustom.headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(55, 30, 55, 40),
                    child: TextField(
                      controller:
                          registerScreenBinding.activeCodeEditingController,
                      style: textThemeCustom.headlineMedium,
                      onChanged: (value) {
                        print("${value}is Email : ${isEmail(value)}");
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'techblog@gmail.com',
                        hintStyle: textThemeCustom.headlineSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      registerScreenBinding.verifyCustom();
                    },
                    child: const Text(
                      'ادامه',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
