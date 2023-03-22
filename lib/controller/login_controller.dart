import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/request/login/login_model.dart';
import '../data/model/response/login/login_response_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final loginResData = LoginResponseModel(
    status: false,
    message: null,
    token: null,
    parent: null,
  ).obs;

  hitLogin(email, password, fcmToken) async {
    try {
      isLoading(true);
      LoginModel loginData = LoginModel(
        email: email,
        password: password,
        fcmToken: fcmToken,
      );

      var res = await APIService().apiLogin(loginModelToJson(loginData));
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        LoginResponseModel lrm = loginResponseModelFromJson(res);
        loginResData.value = lrm;
        loginResData.refresh();
        print(lrm.message);
      } else if (decoded['status'] == false) {
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
