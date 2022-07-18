import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/schoollist_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class SchoolController extends GetxController{
  var isLoading = false.obs;
  final schoolResList = SchoolListRespModel(status: false, log: null).obs;

  @override
  void onInit() {
    super.onInit();
    hitSchoolList();
  }

  hitSchoolList() async {
    try{
      isLoading(true);
      var res = await APIService().apiSchoolList();
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        SchoolListRespModel lrm = schoolListRespModelFromJson(res);
        schoolResList.value = lrm;
        schoolResList.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }

  void updateList({required int id}){
    for(int i=0;i<schoolResList.value.log!.length;i++){
      if(schoolResList.value.log![i].id == id){
        schoolResList.value.log![i].isSelected = !schoolResList.value.log![i].isSelected;
      }else{
        schoolResList.value.log![i].isSelected = false;
      }
    }

    schoolResList.refresh();
  }
}