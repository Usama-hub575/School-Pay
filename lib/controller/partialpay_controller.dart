import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/partialpay_model.dart';
import 'package:paynest_flutter_app/model/partialpay_res_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class PartialPayController extends GetxController{
  var isLoading = false.obs;
  final partialPayData = PartialPayResModel(status: false, message: null, parent: null).obs;


  hitPartialPay(id,fee) async {
    try{
      isLoading(true);
      PartialPayModel model = PartialPayModel(
          id: id,
          fee: fee
      );
      var res = await APIService().apiPartialPay(partialPayModelToJson(model));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        PartialPayResModel addStudentRespModel = partialPayResModelFromJson(res);
        partialPayData.value = addStudentRespModel;
        partialPayData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}