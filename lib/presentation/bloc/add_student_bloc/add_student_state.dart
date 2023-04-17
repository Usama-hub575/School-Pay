part of 'add_student_bloc.dart';

// ignore: must_be_immutable
class AddStudentState extends Equatable {
  AddStudentStatus status = AddStudentStatus.init;

  AddStudentState({
    this.status = AddStudentStatus.init,
  });

  AddStudentState copyWith({
    AddStudentStatus? status,
  }) {
    return AddStudentState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
