import 'package:paynest_flutter_app/export.dart';

MyStudentsResponseModel getMyStudentModel({required StudentData element}) {
  List<StudentData> studentList = [];
  studentList.add(element);

  return MyStudentsResponseModel(
    status: true,
    students: studentList,
  );
}
