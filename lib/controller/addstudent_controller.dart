import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/addstudent_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';


class AddStudentController extends GetxController{
  var isLoading = false.obs;
  final addStudentData = AddStudentRespModel(status: false, message: null).obs;
  bool isStudentAdded = false;
  late String errorMessage;


  hitAddStudent(data) async {
    try{
      isStudentAdded = false;
      isLoading(true);
      var res = await APIService().apiAddStudent(data);
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        AddStudentRespModel addStudentRespModel = addStudentRespModelFromJson(res);
        addStudentData.value = addStudentRespModel;
        isStudentAdded = true;
        addStudentData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }


  addStudentWithPaynestNumber(data) async {
    try{
      isStudentAdded = false;
      isLoading(true);
      var res = await APIService().addStudentWithPaynestNumber(data);
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        AddStudentRespModel addStudentRespModel = addStudentRespModelFromJson(res);
        addStudentData.value = addStudentRespModel;
        isStudentAdded = true;
        addStudentData.refresh();
        isLoading(false);
      }else if(decoded['status'] == false){
        errorMessage = decoded['message'];
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }
}