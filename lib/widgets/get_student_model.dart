import '../data/model/response/dashboard/student/students_response_model.dart';

MyStudentsResponseModel getMyStudentModel({required StudentData element}) {
  List<StudentData> studentList = [];
  studentList.add(element);

  return MyStudentsResponseModel(
    status: true,
    students: studentList,
  );
}
