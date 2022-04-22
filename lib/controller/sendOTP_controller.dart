import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/otp_model.dart';
import 'package:paynest_flutter_app/model/otp_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class SendOTPController extends GetxController{

  var isLoading = false.obs;
  final otpResp =  OtpResponseModel(requestId: null, type: null).obs;


  hitSendOTP(userPhone) async {
    try{
      isLoading(true);
      OtpModel otpData = OtpModel(phone:userPhone );

      var res = await APIService().apiSendOTP(otpModelToJson(otpData));
      var decoded = jsonDecode(res);
      if(decoded['type'] == "success"){
        OtpResponseModel lrm = otpResponseModelFromJson(res);
        otpResp.value = lrm;
        otpResp.refresh();
        // print(lrm.message);
      }else{
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}