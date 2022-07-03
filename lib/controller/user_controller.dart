import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/login_model.dart';
import 'package:paynest_flutter_app/model/login_response_model.dart';
import 'package:paynest_flutter_app/model/register_model.dart';
import 'package:paynest_flutter_app/model/register_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class UserController extends GetxController{
  var isLoading = false.obs;
  final isFailed = "".obs;
  var retriesTime= ''.obs;
  var attemptsRemain= ''.obs;
  final userResData = RegisterRespModel(
      status: false,
      message: null,
      token: null,
      parent: null
  ).obs;

  hitRegister(email,phone,password,firstName,lastName ,dialCode,countryCode,emiratesId,area,country,address,passport) async {
    try{
      isLoading(true);
      RegisterModel registerModel = RegisterModel(
          email: email,
          phone: phone,
          password: password,
          firstName: firstName,
          lastName: lastName,
          dialCode: dialCode,
          countryCode: countryCode,
          emiratesId: emiratesId,
          area: area,
          country: country,
          address: address,
          passport :passport
      );
      var res = await APIService().apiResister(registerModelToJson(registerModel));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        RegisterRespModel lrm = registerRespModelFromJson(res);
        userResData.value = lrm;
        userResData.refresh();
      }else if(decoded['status'] == false){
        isFailed.value = decoded['message'];
        isLoading(false);
      }else{
        isFailed.value = decoded['message'];
      }
    }
    finally{
      isLoading(false);
    }
  }



  /// ** Login ** ///
  

  final loginResData =  LoginResponseModel(
    status: false,
    message: null,
    token: null,
    parent: null,
  ).obs;


  hitLogin(email,password,fcmToken) async {
    try{
      isLoading(true);
      LoginModel loginData = LoginModel(
        email: email,
        password: password,
        fcmToken: fcmToken,
      );

      var res = await APIService().apiLogin(loginModelToJson(loginData));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        // LoginResponseModel lrm = loginResponseModelFromJson(res);
        // loginResData.value = lrm;
        // loginResData.refresh();
        RegisterRespModel lrm = registerRespModelFromJson(res);
        userResData.value = lrm;
        userResData.refresh();
        print(lrm.message);
      }else if(decoded['status'] == false){
        if(decoded['retryInMins'] != null){
          retriesTime.value = decoded['retryInMins'].toString();
          retriesTime.refresh();
        }else if(decoded['remainingAttempts'] != null){
          attemptsRemain.value = decoded['remainingAttempts'].toString();
          attemptsRemain.refresh();
        }else{
          retriesTime.value = '';
          retriesTime.refresh();
          attemptsRemain.value = '';
          attemptsRemain.refresh();
        }
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}