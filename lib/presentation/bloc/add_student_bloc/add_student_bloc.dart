import 'package:paynest_flutter_app/export.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  final AddStudentUseCase addStudentUseCase;

  AddStudentBloc({
    required this.addStudentUseCase,
  }) : super(
          AddStudentState(
            studentListResponseModel: StudentListResponseModel.empty(),
            addStudentResponseModel: AddStudentResponseModel.empty(),
          ),
        ) {
    on<AddFilters>(_addFilters);
    on<DropDownButtonOnChange>(_dropDownButtonOnChange);
    on<AddStudentOnSearchChange>(_onSearchChange);
    on<AddStudentByParentID>(_addStudentByParentID);
    on<AddStudentByStudentID>(_addStudentByStudentID);
    on<AddStudentByFirstName>(_addStudentByFirstName);
    on<AddStudentLoading>(_loading);
  }

  _loading(AddStudentLoading event, emit) {
    emit(
      state.copyWith(
        status: AddStudentStatus.loading,
      ),
    );
  }

  _addStudentByFirstName(AddStudentByFirstName event, emit) async {
    if (state.studentListResponseModel.getStudent != null &&
        state.studentListResponseModel.getStudent!.rows!.isNotEmpty) {
      state.studentListResponseModel.getStudent!.rows!.clear();
    }
    final response = await addStudentUseCase.addStudentByFirstName(
      parentID: event.parentID,
      dob: event.dob,
      studentID: event.studentID,
      studentRegNo: event.studentRegNo,
    );
    return response.fold(
      (success) {
        success.status
            ? emit(
                state.copyWith(
                  status: AddStudentStatus.success,
                  addStudentResponseModel: success,
                ),
              )
            : emit(state.copyWith(
                status: AddStudentStatus.error,
                errorMessage: success.message,
              ));
      },
      (r) {
        emit(
          state.copyWith(
            status: AddStudentStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _addStudentByParentID(AddStudentByParentID event, emit) async {
    if (state.studentListResponseModel.getStudent != null &&
        state.studentListResponseModel.getStudent!.rows!.isNotEmpty) {
      state.studentListResponseModel.getStudent!.rows!.clear();
    }
    final response = await addStudentUseCase.addStudentByParentID(
      parentID: event.parentRegNo,
      studentID: event.studentID,
    );
    return response.fold(
      (success) {
        success.status
            ? emit(
                state.copyWith(
                  status: AddStudentStatus.success,
                  addStudentResponseModel: success,
                ),
              )
            : emit(
                state.copyWith(
                  status: AddStudentStatus.error,
                  errorMessage: success.message,
                ),
              );
      },
      (r) {
        emit(
          state.copyWith(
            status: AddStudentStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _addStudentByStudentID(AddStudentByStudentID event, emit) async {
    if (state.studentListResponseModel.getStudent != null &&
        state.studentListResponseModel.getStudent!.rows!.isNotEmpty) {
      state.studentListResponseModel.getStudent!.rows!.clear();
    }
    final response = await addStudentUseCase.addStudentByStudentID(
      studentRegNo: event.studentRegNo,
      studentID: event.studentID,
    );
    return response.fold(
      (success) {
        success.status
            ? emit(
                state.copyWith(
                  status: AddStudentStatus.success,
                  addStudentResponseModel: success,
                ),
              )
            : emit(
                state.copyWith(
                  status: AddStudentStatus.error,
                  errorMessage: success.message,
                ),
              );
      },
      (r) {
        emit(
          state.copyWith(
            status: AddStudentStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _onSearchChange(AddStudentOnSearchChange event, emit) async {
    List<StudentListRowData> list = [];
    if (event.value == '') {
      list = state.rowData;
      emit(
        state.copyWith(
          searchResult: list,
        ),
      );
    } else {
      switch (state.selectedFilter) {
        case 'Name':
          if (state.studentListResponseModel.getStudent != null &&
              state.studentListResponseModel.getStudent!.rows!.isNotEmpty) {
            state.studentListResponseModel.getStudent!.rows!.clear();
          }
          await addStudentUseCase.search(
            searchBy: 'Name',
            queryParam: event.queryParam,
            schoolID: event.schoolID,
          );
          // isLoading = false;
          if (state.studentListResponseModel.getStudent != null) {
            for (var studentDetails
                in state.studentListResponseModel.getStudent!.rows!) {
              list.add(studentDetails);
            }
            emit(
              state.copyWith(
                searchResult: list,
              ),
            );
          }
          break;
        case 'Account Number':
          if (state.studentListResponseModel.getStudent != null &&
              state.studentListResponseModel.getStudent!.rows!.isNotEmpty) {
            state.studentListResponseModel.getStudent!.rows!.clear();
          }
          await addStudentUseCase.search(
            searchBy: 'Account',
            queryParam: event.queryParam,
            schoolID: event.schoolID,
          );
          // isLoading = false;
          if (state.studentListResponseModel.getStudent != null) {
            for (var studentDetails
                in state.studentListResponseModel.getStudent!.rows!) {
              list.add(studentDetails);
            }
            emit(
              state.copyWith(
                searchResult: list,
              ),
            );
          }
          break;
        case 'Student ID':
          if (state.studentListResponseModel.getStudent != null &&
              state.studentListResponseModel.getStudent!.rows!.isNotEmpty) {
            state.studentListResponseModel.getStudent!.rows!.clear();
          }
          await addStudentUseCase.search(
            searchBy: 'StudentID',
            queryParam: event.queryParam,
            schoolID: event.schoolID,
          );
          // isLoading = false;
          if (state.studentListResponseModel.getStudent != null) {
            for (var studentDetails
                in state.studentListResponseModel.getStudent!.rows!) {
              list.add(studentDetails);
            }
            emit(
              state.copyWith(
                searchResult: list,
              ),
            );
          }
          break;
      }
    }
  }

  _dropDownButtonOnChange(DropDownButtonOnChange event, emit) {
    emit(
      state.copyWith(
        selectedFilter: event.value,
        isSearchFieldEnable: event.isSearchFieldEnable,
      ),
    );
  }

  _addFilters(AddFilters event, emit) {
    event.studentType == "STUDENT"
        ? emit(
            state.copyWith(
              filters: ['Name', 'Account Number', 'Student ID'],
            ),
          )
        : emit(
            state.copyWith(
              filters: ['Account Number'],
            ),
          );
  }
}
