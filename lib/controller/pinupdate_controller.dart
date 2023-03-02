import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/pinupdate_model.dart';
import '../data/model/pinupdate_resp_model.dart';

class PinUpdateController extends GetxController{
  var isLoading = false.obs;
  final pinData = PinUpdateResModel(
      status: false,
      message: null,
      parent: null
  ).obs;

  hitUpdatePin(data,parentID) async {
    try{
      PinUpdateModel pnm = PinUpdateModel(
          id: parentID.toString(),
          pin: data
      );
      isLoading(true);
      var res = await APIService().apiPinUpdate(pinUpdateModelToJson(pnm));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        PinUpdateResModel pin = pinUpdateResModelFromJson(res);
        pinData.value = pin;
        pinData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}