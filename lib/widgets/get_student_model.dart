import 'package:paynest_flutter_app/data/model/mystudents_resp_model.dart';

MyStudentsRespModel getMyStudentModel({required StudentElement element}) {
  List<StudentElement> studentList = [];
  studentList.add(element);

  return MyStudentsRespModel(
    status: true,
    students: studentList,
  );
}
