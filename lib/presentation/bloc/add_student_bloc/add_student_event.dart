part of 'add_student_bloc.dart';

abstract class AddStudentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddFilters extends AddStudentEvent {
  final String studentType;

  AddFilters({
    required this.studentType,
  });
}

class AddStudentLoading extends AddStudentEvent {}

class AddStudentOnSearchChange extends AddStudentEvent {
  final String value;
  final int schoolID;
  final String queryParam;

  AddStudentOnSearchChange({
    required this.value,
    required this.schoolID,
    required this.queryParam,
  });
}

class AddStudentByParentID extends AddStudentEvent {
  final String parentRegNo;
  final String studentID;

  AddStudentByParentID({
    required this.studentID,
    required this.parentRegNo,
  });
}

class AddStudentByFirstName extends AddStudentEvent {
  final String parentID;
  final String dob;
  final String studentID;
  final String studentRegNo;

  AddStudentByFirstName({
    required this.parentID,
    required this.dob,
    required this.studentID,
    required this.studentRegNo,
  });
}

class AddStudentByStudentID extends AddStudentEvent {
  final String studentRegNo;
  final String studentID;

  AddStudentByStudentID({
    required this.studentID,
    required this.studentRegNo,
  });
}

class DropDownButtonOnChange extends AddStudentEvent {
  final String? value;
  final bool isSearchFieldEnable;

  DropDownButtonOnChange({
    required this.value,
    required this.isSearchFieldEnable,
  });
}
