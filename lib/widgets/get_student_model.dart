import '../data/model/response/dashboard/students/students_response_model.dart';

MyStudentsResponseModel getMyStudentModel({required StudentData element}) {
  List<StudentData> studentList = [];
  studentList.add(element);

  return MyStudentsResponseModel(
    status: true,
    students: studentList,
  );
}
