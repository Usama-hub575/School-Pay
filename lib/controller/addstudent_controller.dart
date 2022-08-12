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

  hitAddStudentByFirstName(data) async {
    try{
      isStudentAdded = false;
      isLoading(true);
      var res = await APIService().apiAddStudentByFirstName(data);
      var decoded = jsonDecode(res);
      AddStudentRespModel addStudentRespModel = addStudentRespModelFromJson(res);
      addStudentData.value = addStudentRespModel;
      if(decoded['status'] == true){
        isStudentAdded = true;
      }else if(decoded['status'] == false){
        isStudentAdded = false;
        isLoading(false);
      }
      addStudentData.refresh();
    }
    finally{
      isLoading(false);
    }
  }

  hitAddStudentByParentId(data) async {
    try{
      isStudentAdded = false;
      isLoading(true);
      var res = await APIService().apiAddStudentByParentRegistrationNumber(data);
      var decoded = jsonDecode(res);
      AddStudentRespModel addStudentRespModel = addStudentRespModelFromJson(res);
      addStudentData.value = addStudentRespModel;
      if(decoded['status'] == true){
        isStudentAdded = true;
      }else if(decoded['status'] == false){
        isStudentAdded = false;
        isLoading(false);
      }
      addStudentData.refresh();
    }
    finally{
      isLoading(false);
    }
  }

  hitAddStudentByStudentId(data) async {
    try{
      isStudentAdded = false;
      isLoading(true);
      var res = await APIService().apiAddStudentByStudentRegistrationNumber(data);
      var decoded = jsonDecode(res);
      AddStudentRespModel addStudentRespModel = addStudentRespModelFromJson(res);
      addStudentData.value = addStudentRespModel;
      if(decoded['status'] == true){
        isStudentAdded = true;
      }else if(decoded['status'] == false){
        isStudentAdded = false;
        isLoading(false);
      }
      addStudentData.refresh();
    }
    finally{
      isLoading(false);
    }
  }

  hitAddStudentByStudentFirstName(data) async {
    try{
      isStudentAdded = false;
      isLoading(true);
      var res = await APIService().apiAddStudentByFirstName(data);
      var decoded = jsonDecode(res);
      AddStudentRespModel addStudentRespModel = addStudentRespModelFromJson(res);
      addStudentData.value = addStudentRespModel;
      if(decoded['status'] == true){
        isStudentAdded = true;
      }else if(decoded['status'] == false){
        isStudentAdded = false;
        isLoading(false);
      }
      addStudentData.refresh();
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
        isLoading(false);
      }else if(decoded['status'] == false){
        errorMessage = decoded['message'];
        isLoading(false);
      }
      addStudentData.refresh();
    }
    finally{
      isLoading(false);
    }
  }
}