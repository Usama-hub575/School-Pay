import 'package:paynest_flutter_app/export.dart';

part 'school_list_event.dart';
part 'school_list_state.dart';

class SchoolListBloc extends Bloc<SchoolListEvent, SchoolListState> {
  SchoolListUseCase schoolListUseCase;

  SchoolListBloc({
    required this.schoolListUseCase,
  }) : super(
          SchoolListState(),
        ) {
    on<GetSchoolList>(_getSchoolList);
    on<OnSearchChange>(_onSearchChange);
    on<SchoolListLoading>(_loading);
  }

  _loading(SchoolListLoading event, emit) {
    emit(
      state.copyWith(
        status: SchoolListStatus.loading,
      ),
    );
  }

  _onSearchChange(OnSearchChange event, emit) {
    List<Log> list = [];
    if (event.value == '') {
      list = state.log;
      emit(
        state.copyWith(
          searchResult: list,
        ),
      );
    } else {
      for (var schoolDetail in state.log) {
        if (schoolDetail.name
                .toUpperCase()
                .contains(event.value.toUpperCase()) ||
            schoolDetail.address.toUpperCase().contains(
                  event.value.toUpperCase(),
                )) {
          list.add(schoolDetail);
        }
      }
      emit(
        state.copyWith(
          searchResult: list,
        ),
      );
    }
  }

  _getSchoolList(GetSchoolList event, emit) async {
    add(
      SchoolListLoading(),
    );
    final response = await schoolListUseCase.getSchoolList();
    return response.fold(
      (success) {
        success.status
            ? emit(
                state.copyWith(
                  status: SchoolListStatus.success,
                  log: success.log,
                ),
              )
            : emit(
                state.copyWith(
                  status: SchoolListStatus.error,
                ),
              );
      },
      (r) {
        emit(
          state.copyWith(
            status: SchoolListStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }
}
