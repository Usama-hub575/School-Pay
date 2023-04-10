import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/response/register/register_response_model.dart';
import '../data/model/response/update_profile/update_profile_response_model.dart';
import '../data/model/updateprofile_model.dart';

class UpdateProfileController extends GetxController {
  var isLoading = false.obs;
  var isFailed = "".obs;
  var message = "".obs;
  final updateProfileData =
      UpdateProfileResponseModel(status: false, message: null, parent: null)
          .obs;

  hitUpdateProfile(
    id,
    firstName,
    lastName,
    email,
    expiryDate,
    emiratesId,
    UserController userController,
  ) async {
    isLoading(true);
    UpdateProfileModel model = UpdateProfileModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        expiryDate: expiryDate,
        emiratesId: emiratesId);

    try {
      var res = await APIService().apiUpdateProfile(
        updateProfileModelToJson(model),
      );
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        UpdateProfileResponseModel updateProfileRespModel =
            updateProfileResponseModelFromJson(res);
        updateProfileData.value = updateProfileRespModel;
        message.value = decoded["message"];
        var updateRes = await APIService().refreshUserData(
          parentId: id,
        );
        userController.userResData.value =
            registerResponseModelFromJson(updateRes);
        userController.userResData.refresh();
        updateProfileData.refresh();
        isLoading(false);
      } else if (decoded['status'] == false) {
        isFailed.value = decoded['message'];
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
