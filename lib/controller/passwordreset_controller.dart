import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/passwordreset_model.dart';
import '../data/model/passwordreset_resp_model.dart';

class PasswordResetController extends GetxController{
  var isLoading = false.obs;
  final resetPassData = PasswordResetRespModel(status: false, message: null).obs;


  hitResetPassword(parentId,oldPassword,newPassword) async {
    PasswordResetModel model = PasswordResetModel(
        parentId: parentId,
        oldPassword: oldPassword,
        newPassword: newPassword
    );

    try{
      isLoading(true);
      var res = await APIService().apiResetPassword(passwordResetModelToJson(model));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        PasswordResetRespModel reset = passwordResetRespModelFromJson(res);
        resetPassData.value = reset;
        resetPassData.refresh();
      }else if(decoded['status'] == false){
        PasswordResetRespModel reset = passwordResetRespModelFromJson(res);
        resetPassData.value = reset;
        resetPassData.refresh();
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}