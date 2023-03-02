import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/otp_model.dart';
import '../data/model/otp_resp_model.dart';

class SendOTPController extends GetxController {
  var isLoading = false.obs;
  var status = false.obs;
  var errorMessage = "".obs;
  final otpResp = OtpResponseModel(requestId: null, type: null).obs;

  hitSendOTP(email, userPhone, dailCode) async {
    try {
      isLoading(true);
      OtpModel otpData = OtpModel(
        email: email,
        phone: userPhone,
        dailCode: dailCode
      );

      var res = await APIService().apiSendOTP(otpModelToJson(otpData));
      var decoded = jsonDecode(res);
      if (decoded['status']) {
        status.value = decoded['status'] ?? false;
        errorMessage.value = decoded['message'] ?? "";
        OtpResponseModel lrm = otpResponseModelFromJson(res);
        otpResp.value = lrm;
        otpResp.refresh();
        // print(lrm.message);
      } else if (!(decoded['status'] as bool)) {
        status.value = decoded['status'] ?? false;
        errorMessage.value = decoded['message'] ?? "";
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
