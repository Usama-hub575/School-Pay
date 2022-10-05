import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paynest_flutter_app/model/get_countries_response.dart';
import 'package:paynest_flutter_app/model/login_model.dart';
import 'package:paynest_flutter_app/model/login_response_model.dart';
import 'package:paynest_flutter_app/model/register_model.dart';
import 'package:paynest_flutter_app/model/register_resp_model.dart';
import 'package:paynest_flutter_app/model/reset_password_by_otp.dart';
import 'package:paynest_flutter_app/service/api_service.dart';
import 'package:paynest_flutter_app/utils/sharedpref.dart';

import '../constants/constants.dart';
import '../model/forgot_password_resp_model.dart';
import '../utils/sharedPrefKeys.dart';

MySharedPreferences preferences = MySharedPreferences.instance;

class UserController extends GetxController {
  var isLoading = false.obs;
  final isFailed = ''.obs;
  var retriesTime = ''.obs;
  var attemptsRemain = ''.obs;
  final storage = GetStorage();
  var errorMessage = "Something went wrong on server side!";
  final userResData =
      RegisterRespModel(status: false, message: null, token: null, parent: null)
          .obs;
  final getCountriesResponse = GetCountriesResponse(
    status: false,
    countries: [],
  ).obs;
  var forgotPasswordResData =
      ForgotPasswordRespModel(status: false, message: null).obs;

  hitRegister(
    firstName,
    lastName,
    password,
    email,
    countryCode,
    dialCode,
    phone,
    emiratesId,
    gender,
    birth,
    passport,
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
        dialCode: dialCode,
        emiratesId: emiratesId,
        passport: emiratesId,
        gender: gender,
        birth: birth,
      );
      var res =
          await APIService().apiResister(registerModelToJson(registerModel));
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        RegisterRespModel lrm = registerRespModelFromJson(res);
        userResData.value = lrm;
        storage.write(
          SharedPrefKeys.accessToken,
          lrm.token.toString(),
        );
        preferences.setStringValue(SharedPrefKeys.userEmail, email);
        preferences.setStringValue(SharedPrefKeys.userPassword, password);
        userResData.refresh();
      } else if (decoded['status'] == false) {
        isFailed.value = decoded['message'];
        isLoading(false);
      } else {
        isFailed.value = decoded['message'];
      }
    } finally {
      isLoading(false);
    }
  }

  /// ** Login ** ///

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
      isLoading(false);
      if(res != null){
        if(res!= ""){
          var decoded = jsonDecode(res);
          RegisterRespModel lrm = registerRespModelFromJson(res);
          if (decoded['status'] == true) {
            userResData.value = lrm;
            userResData.refresh();
            print(lrm.message);
            preferences.setStringValue(SharedPrefKeys.userEmail, email);
            preferences.setStringValue(SharedPrefKeys.userPassword, password);
            preferences.setStringValue(SharedPrefKeys.fcmToken, fcmToken);
          } else if (decoded['status'] == false) {
            userResData.value = lrm;
            userResData.refresh();
            if (decoded['retryInMins'] != null) {
              retriesTime.value = decoded['retryInMins'].toString();
              retriesTime.refresh();
            } else if (decoded['remainingAttempts'] != null) {
              attemptsRemain.value = decoded['remainingAttempts'].toString();
              attemptsRemain.refresh();
            } else {
              retriesTime.value = '';
              retriesTime.refresh();
              attemptsRemain.value = '';
              attemptsRemain.refresh();
            }
            userResData.refresh();
          }
        }
      }
      else{
        userResData.value.status == "false";
        retriesTime.value = '';
        retriesTime.refresh();
        attemptsRemain.value = '';
        attemptsRemain.refresh();
      }
    } finally {
      isLoading(false);
    }
  }

  void hitGetCountriesAPI() async {
    var res = await APIService().apiGetCountries();
    var decoded = jsonDecode(res);
    if (decoded['status'] == true) {
      GetCountriesResponse getCountries =
          GetCountriesResponse.fromJson(decoded);
      getCountriesResponse.value = getCountries;
      getCountriesResponse.refresh();
      isLoading(false);
    } else if (decoded['status'] == false) {
    } else {
      isFailed.value = decoded['message'];
    }
  }

  hitResetPasswordByOTP(
    email,
    otpValue,
    password,
  ) async {
    try {
      isLoading(true);
      ResetPasswordByOTP resetPasswordByOTP = ResetPasswordByOTP(
        email: email,
        otpValue: otpValue,
        password: password,
      );
      var res = await APIService().apiResetPasswordByOTP(
        resetPasswordByOTPModelToJson(
          resetPasswordByOTP,
        ),
      );
      var decoded = jsonDecode(res);
      ForgotPasswordRespModel lrm = forgotPasswordRespModelFromJson(res);
      if (decoded['status'] == true) {
        forgotPasswordResData.value = lrm;
        print(decoded['message']);
      } else if (decoded['status'] == false) {
        isFailed.value = decoded['message'];
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
