import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/updateprofile_model.dart';
import 'package:paynest_flutter_app/model/updateprofile_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class UpdateProfileController extends GetxController {
  var isLoading = false.obs;
  var isFailed = "".obs;
  var message = "".obs;
  final updateProfileData =
      UpdateProfileRespModel(status: false, message: null, parent: null).obs;

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
        UpdateProfileRespModel updateProfileRespModel =
            updateProfileRespModelFromJson(res);
        updateProfileData.value = updateProfileRespModel;
        message.value = decoded["message"];
        await APIService().refreshUserData(
          parentId: updateProfileRespModel.parent![0],
        );

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
