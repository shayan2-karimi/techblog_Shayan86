import 'package:flutter/widgets.dart';
import 'package:flutter_application_66666/componet/myapi_constant.dart';
import 'package:flutter_application_66666/componet/storage_cont.dart';
import 'package:flutter_application_66666/services/dio_servic.dart';
import 'package:flutter_application_66666/view/main_screen.dart';
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
        await DioServic().postMethod(mapReg, MyapiConstant.myPostRegister);

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
        await DioServic().postMethod(mapReg, MyapiConstant.myPostRegister);
    print(responseReg.data);

// {response: verified, user_id: 553, token: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NTUzLCJlbWFpbCI6InNoYXlhbmthcmltaWlpODY4NkBnbWFpbC5jb20ifQ.9oawwXo0vYOll2dbipQUhjAOIGPAHros6mu2Ft31TxM}

    if (responseReg.data['response'] == 'verified') {
      var boxStorage = GetStorage();
      boxStorage.write(token, responseReg.data['token']);
      boxStorage.write(userId, responseReg.data['user_id']);

      print('shayan::::' + boxStorage.read(token));
      print('shayan::::' + boxStorage.read(userId));
    } else {
      print('erorr');
    }
  }
}
