import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/register_model.dart';
import 'package:paynest_flutter_app/model/register_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class RegisterController extends GetxController{
  var isLoading = false.obs;
  final isFailed = "".obs;
  final registerResData =  RegisterRespModel(
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
          passport: passport
      );

      var res = await APIService().apiResister(registerModelToJson(registerModel));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        RegisterRespModel lrm = registerRespModelFromJson(res);
        registerResData.value = lrm;
        registerResData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }else{
        isFailed.value = decoded['message'];
      }
    }
    finally{
      isLoading(false);
    }
  }
}