import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/updateprofile_model.dart';
import 'package:paynest_flutter_app/model/updateprofile_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class UpdateProfileController extends GetxController{
  var isLoading = false.obs;
  final updateProfileData = UpdateProfileRespModel(
      status: false,
      message: null,
      parent: null
  ).obs;


  hitUpdateProfile(id,firstName,lastName) async {
    UpdateProfileModel model = UpdateProfileModel(
        id: id,
        firstName: firstName,
        lastName: lastName
    );

    try{
      isLoading(true);
      var res = await APIService().apiUpdateProfile(updateProfileModelToJson(model));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        UpdateProfileRespModel reset = updateProfileRespModelFromJson(res);
        updateProfileData.value = reset;
        updateProfileData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}