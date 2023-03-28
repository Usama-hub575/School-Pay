import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/request/otp/verify_otp/otp_verify_model.dart';
import '../data/model/response/otp/verify_otp_response/otp_verify_response_model.dart';

class VerifyOTPController extends GetxController {
  var isLoading = false.obs;
  var isSuccess = false.obs;
  final otpVerifyData = OTPVerifyResModel(message: null, type: null).obs;

  hitVerifyOTP(userPhone, otpCode) async {
    try {
      isLoading(true);
      OtpVerifyModel otpData = OtpVerifyModel(phone: userPhone, otp: otpCode);

      var res = await APIService().apiVerifyOTP(otpVerifyModelToJson(otpData));
      var decoded = jsonDecode(res);
      if (decoded['type'] == "success") {
        OTPVerifyResModel lrm = oTPVerifyResModelFromJson(res);
        otpVerifyData.value = lrm;
        otpVerifyData.refresh();
        isSuccess(true);
      } else {
        isSuccess(false);
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
