import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/request/otp/send_otp/otp_model.dart';
import '../data/model/response/otp/send_otp_response/otp_response_model.dart';

class SendOTPController extends GetxController {
  var isLoading = false.obs;
  var status = false.obs;
  var errorMessage = "".obs;
  final otpResp = OTPResponseModel(status: null, message: null).obs;

  hitSendOTP(email, userPhone, dailCode) async {
    try {
      isLoading(true);
      OtpModel otpData =
          OtpModel(email: email, phone: userPhone, dialCode: dailCode);

      var res = await APIService().apiSendOTP(otpModelToJson(otpData));
      var decoded = jsonDecode(res);
      if (decoded['status']) {
        status.value = decoded['status'] ?? false;
        errorMessage.value = decoded['message'] ?? "";
        OTPResponseModel lrm = OTPResponseModel.fromJson(res);
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
