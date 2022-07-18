import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/mystudents_model.dart';
import 'package:paynest_flutter_app/model/mystudents_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class MyStudentController extends GetxController {
  var isLoading = false.obs;
  final myStudentData = MyStudentsRespModel(status: false, students: null).obs;

  hitMyStudents(parentID) async {
    try {
      isLoading(true);
      MyStudentsModel model = MyStudentsModel(parentId: parentID);

      var res = await APIService().apiMyStudents(
        myStudentsModelToJson(model),
      );
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        MyStudentsRespModel respModel = myStudentsRespModelFromJson(res);
        myStudentData.value = respModel;
        myStudentData.refresh();
      } else if (decoded['status'] == false) {
        isLoading(false);
      } else {
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void updateSelectedCard(int studentId) {
    for (int i = 0; i < myStudentData.value.students!.length; i++) {
      if (myStudentData.value.students![i].id == studentId) {
        myStudentData.value.students![i].isSelected = true;
      } else {
        myStudentData.value.students![i].isSelected = false;
      }
    }

    myStudentData.refresh();
  }

  void resetStudentCard() {
    for (int i = 0; i < myStudentData.value.students!.length; i++) {
      myStudentData.value.students![i].isSelected = false;
    }

    myStudentData.refresh();
  }
}
