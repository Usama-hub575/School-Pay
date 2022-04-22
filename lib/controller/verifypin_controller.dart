import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/verifypin_model.dart';
import 'package:paynest_flutter_app/model/verifypin_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class VerifyPinController extends GetxController {
  var isLoading = false.obs;
  final verifyPinData = VerifyPinResModel(
    status: false,
    message: null,
  ).obs;


  hitVerifyPin(parentId,pin) async {
    try{
      isLoading(true);
      VerifyPinModel verifyPinModel = VerifyPinModel(
          parentId: parentId.toString(),
          pin: pin
      );
      var res = await APIService().apiVerifyPin(verifyPinModelToJson(verifyPinModel));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        VerifyPinResModel vprm = verifyPinResModelFromJson(res);
        verifyPinData.value = vprm;
        verifyPinData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}