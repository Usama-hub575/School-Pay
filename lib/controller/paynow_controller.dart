import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../data/model/paynowres_model.dart';

class PayNowController extends GetxController{
  var isLoading = false.obs;
  final payNowData =  PayNowResModel(url: "", hiddendata: null).obs;


  hitPayNow(amount,parentID,studentID) async {
    try{
      isLoading(true);
      final payNowMap= {
        "amount": amount,
        // "parentID": parentID,
        // "studentID": studentID,
      };
      var res = await APIService().apiPayNow(payNowMap);
      // var decoded = jsonDecode(res);
      // if(decoded['hiddendata'] != null){
      //   PayNowResModel respModel = payNowResModelFromJson(res);
      //   payNowData.value = respModel;
      //   payNowData.refresh();
      // }else if(decoded['url'] == null){
      //   isLoading(false);
      // }else {
      //   isLoading(false);
      // }
      final data = Uri.dataFromString(
        res,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString();
      if(data != null){
        payNowData.update((val) {
          val!.url= data;
          payNowData.refresh();
        });
      }
    }
    finally{
      isLoading(false);
    }
  }
}