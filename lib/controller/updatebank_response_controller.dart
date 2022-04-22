import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/updatebank_model.dart';
import 'package:paynest_flutter_app/model/updatebank_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class SetBankResponseController extends GetxController {
  var isLoading = false.obs;
  final bankResponseData = UpdateBankRespModel(
    status: false,
    message: '',
    paidOn: null,
    referenceNo: null,
    student: null,
  ).obs;

  hitSetBankResponse(resID,response) async {
    try{
      isLoading(true);
      UpdateBankModel model = UpdateBankModel(
        Id: resID.toString(),
        bankResponse: response.toString()
      );

      var res = await APIService().apiUpdateBankResponse(updateBankModelToJson(model));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        UpdateBankRespModel respModel = updateBankRespModelFromJson(res);
        bankResponseData.value = respModel;
        bankResponseData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }else {
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }

}