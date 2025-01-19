// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/componet/storage_cont.dart';
import 'package:flutter_application_66666/gen/assets.gen.dart';
import 'package:flutter_application_66666/main.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:flutter_application_66666/view/main_screen.dart';
import 'package:flutter_application_66666/view/register/register_intro.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeEditingController = TextEditingController();

  var email = '';
  var userId = '';

  registerCustom() async {
    Map<String, dynamic> mapReg = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };
    var responseReg =
        await DioServic().postMethod(mapReg, MyapiUrlConstant.myPostRegister);

    email = emailTextEditingController.text;
    userId = responseReg.data['user_id'];

    print(responseReg);
  }

  verifyCustom() async {
    Map<String, dynamic> mapReg = {
      'email': email,
      'user_id': userId,
      'code': activeCodeEditingController.text,
      'command': 'verify',
    };
    print(mapReg);
    var responseReg =
        await DioServic().postMethod(mapReg, MyapiUrlConstant.myPostRegister);
    print(responseReg.data);

// {response: verified, user_id: 553, token: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NTUzLCJlbWFpbCI6InNoYXlhbmthcmltaWlpODY4NkBnbWFpbC5jb20ifQ.9oawwXo0vYOll2dbipQUhjAOIGPAHros6mu2Ft31TxM}

    switch (responseReg.data['response']) {
      case 'verified':
        var GetStorageC = GetStorage();
        GetStorageC.write(StorageCont.token, responseReg.data['token']);
        GetStorageC.write(StorageCont.userId, responseReg.data['user_id']);

        debugPrint('shayan::::' + GetStorageC.read(StorageCont.token));
        debugPrint('shayan::::' + GetStorageC.read(StorageCont.userId));
        Get.offAll(MainScreen());
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعال سازی وارد شده اشتباه است.');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعال سازی وارد شده منقضی شده است.');
        break;
    }
  }

  isLogin() {
    if (GetStorage().read(StorageCont.token) == null) {
      Get.to(RegisterIntro());
    } else {
      sendBottemsheet();
    }
  }
}

sendBottemsheet() {
  Get.bottomSheet(
    Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 12),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.w3c1.path,
                  height: 45,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'دونسته هات رو با بقیه به اشتراک بذار ...',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '''فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
 دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..''',
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 14,
                  color: Color.fromARGB(255, 70, 70, 70),
                  fontWeight: FontWeight.w700),
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(StrongConst.manageArticleRoute);
                    },
                    child: Container(
                      color: Colors.white,
                      height: 80,
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.images.pencelSheet.path,
                            scale: 2,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text('مدیریت مقاله ها')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('send pudcast');
                    },
                    child: Container(
                      color: Colors.white,
                      height: 80,
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.images.microphoneSheet.path,
                            scale: 2,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text('مدیریت پادکست ها'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
