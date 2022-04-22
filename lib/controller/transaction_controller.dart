import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class TransactionController extends GetxController{
  var isLoading = false.obs;
  // final transactionData = AddStudentRespModel(status: false, message: null).obs;

  // hitTransaction(data) async {
  //   try{
  //     isLoading(true);
  //     var res = await APIService().apiTransaction(data);
  //     var decoded = jsonDecode(res);
  //     if(decoded['status'] == true){
  //       AddStudentRespModel addStudentRespModel = addStudentRespModelFromJson(res);
  //       transactionData.value = addStudentRespModel;
  //       transactionData.refresh();
  //     }else if(decoded['status'] == false){
  //       isLoading(false);
  //     }
  //   }
  //   finally{
  //     isLoading(false);
  //   }
  // }
}