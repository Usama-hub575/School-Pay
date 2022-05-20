import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/studentlist_res_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class StudentListController extends GetxController {
  var isLoading = false.obs;
  final studentList = StudentListRespModel(status: false, getStudent: null).obs;

  @override
  void onInit() {
    super.onInit();
  }

  search({
    required String searchBy,
    required String queryParam,
    required int schoolId,
  }) async {
    try {
      var res = await APIService().search(
        queryParam: queryParam,
        searchBy: searchBy,
        schoolId: schoolId,
      );
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        StudentListRespModel slrm = studentListRespModelFromJson(res);
        studentList.value = slrm;
        studentList.refresh();
      } else if (decoded['status'] == false) {}
    } finally {}
  }
}
