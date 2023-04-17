import 'package:paynest_flutter_app/export.dart';

part 'add_student_event.dart';

part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  final AddStudentUseCase addStudentUseCase;

  AddStudentBloc({
    required this.addStudentUseCase,
  }) : super(
          AddStudentState(),
        ) {
    // on<>()
  }
}
