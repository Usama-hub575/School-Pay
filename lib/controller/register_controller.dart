import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/forgot_password_resp_model.dart';
import 'package:paynest_flutter_app/model/register_model.dart';
import 'package:paynest_flutter_app/model/register_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';
import '../model/forgot_password_model.dart';
import '../model/forgot_password_model.dart';
import '../model/mystudents_model.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final isFailed = "".obs;
  final registerResData =
      RegisterRespModel(status: false, message: null, token: null, parent: null)
          .obs;
  var forgotPasswordResData =
      ForgotPasswordRespModel(status: false, message: null).obs;

  hitRegister(
    email,
    phone,
    password,
    firstName,
    lastName,
    dialCode,
    countryCode,
    emiratesId,
    passport,
    gender,
    birth,
  ) async {
    try {
      isLoading(true);
      RegisterModel registerModel = RegisterModel(
        email: email,
        phone: phone,
        password: password,
        firstName: firstName,
        lastName: lastName,
        countryCode: countryCode,
        emiratesId: emiratesId,
        passport: passport,
        birth: '',
        gender: gender,
      );
      var res =
          await APIService().apiResister(registerModelToJson(registerModel));
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        RegisterRespModel lrm = registerRespModelFromJson(res);
        registerResData.value = lrm;
        registerResData.refresh();
      } else if (decoded['status'] == false) {
        isLoading(false);
      } else {
        isFailed.value = decoded['message'];
      }
    } finally {
      isLoading(false);
    }
  }

  hitForgotPassword(email) async {
    isLoading(true);
    try {
      ForgotPasswordModel forgotPasswordModel =
          ForgotPasswordModel(email: email);

      var res = await APIService().apiForgotPassword(
        forgotPasswordModelToJson(
          forgotPasswordModel,
        ),
      );
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        ForgotPasswordRespModel lrm = forgotPasswordRespModelFromJson(res);
        forgotPasswordResData.value = lrm;
        print(decoded['message']);
      } else if (decoded['status'] == false) {
        isFailed.value = decoded['message'];
        forgotPasswordResData.refresh();
        isLoading(false);
      } else {
        isFailed.value = decoded['message'];
      }
      forgotPasswordResData.refresh();
    } finally {
      isLoading(false);
    }
  }
}
