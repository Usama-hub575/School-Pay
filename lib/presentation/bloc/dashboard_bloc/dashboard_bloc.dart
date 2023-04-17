import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.dashboardUseCase,
  }) : super(
          DashboardState(
            transactionListResponseModel: TransactionListResponseModel.empty(),
            singleStudentResponseModel: SingleStudentResponseModel(),
            myStudentsResponseModel: MyStudentsResponseModel.empty(),
          ),
        ) {
    on<FetchStudents>(_fetchStudents);
    on<FetchTransactions>(_fetchTransactions);
    on<GetName>(_getName);
    on<ShowShimmer>(_showShimmer);
    on<IsBioMetricEnable>(_isBioMetricEnable);
    on<RadioButtonOnTap>(_radioButtonOnTap);
    on<GetStudentByID>(_getStudentByID);
    on<UpdatedSelectedCard>(_updatedSelectedCard);
    on<ResetSelectedCard>(_resetSelectedCard);
    on<PayNowOnSearchChange>(_onSearchChange);
  }

  DashboardUseCase dashboardUseCase;

  _isBioMetricEnable(IsBioMetricEnable event, emit) {
    emit(
      state.copyWith(
        isBioMetricEnable: dashboardUseCase.getBool(),
      ),
    );
  }

  _onSearchChange(PayNowOnSearchChange event, emit) {
    List<StudentData> list = [];
    if (event.value == '') {
      list = state.students;
      emit(
        state.copyWith(
          searchResult: list,
        ),
      );
    } else {
      for (var studentData in state.students) {
        var name =
            '${studentData.student!.firstName.trim().toUpperCase()} ${studentData.student!.lastName.trim().toUpperCase()}';
        if (name.contains(
          event.value.toUpperCase(),
        )) {
          list.add(studentData);
        }
      }
      emit(
        state.copyWith(
          searchResult: list,
        ),
      );
    }
  }

  _getStudentByID(GetStudentByID event, emit) async {
    final response = await dashboardUseCase.getStudentsByID(
      userID: event.userID,
    );
    response.fold(
      (success) {
        emit(
          state.copyWith(
            singleStudentResponseModel: success,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: DashboardStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _radioButtonOnTap(RadioButtonOnTap event, emit) async {
    if (event.value) {
      emit(
        state.copyWith(
          isBioMetricEnable: await LocalAuthApi.authenticateWithBiometrics(),
        ),
      );
    }
    if (!event.value) {
      dashboardUseCase.setBool(key: SharedPrefKeys.isBioMatric, value: false);
    } else {
      dashboardUseCase.setBool(
          key: SharedPrefKeys.isBioMatric, value: state.isBioMetricEnable);
    }
  }

  _getName(GetName event, emit) {
    emit(
      state.copyWith(
        firstName: dashboardUseCase.getString(
          key: StorageKeys.firstName,
        ),
        lastName: dashboardUseCase.getString(
          key: StorageKeys.lastName,
        ),
      ),
    );
  }

  _fetchStudents(FetchStudents event, emit) async {
    final response = await dashboardUseCase.fetchStudents();
    response.fold(
      (success) {
        emit(
          state.copyWith(
            students: success.students,
            myStudentsResponseModel: success,
            searchResult: success.students,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: DashboardStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _showShimmer(ShowShimmer event, emit) {
    emit(
      state.copyWith(
        showShimmer: true,
      ),
    );
  }

  _fetchTransactions(FetchTransactions event, emit) async {
    add(
      ShowShimmer(),
    );
    final response = await dashboardUseCase.fetchTransactions();
    response.fold(
      (success) {
        if (success.transactions?.rows != null) {
          var list = {};
          for (int i = 0; i < success.transactions!.rows!.length; i++) {
            String date = DateFormat("yyyy-MM-dd").format(
              success.transactions!.rows![i].payedOn,
            );
            if (list.containsKey(date)) {
            } else {
              List<TransactionsRow> transactionsList = [];
              for (int j = 0; j < success.transactions!.rows!.length; j++) {
                String temp = DateFormat("yyyy-MM-dd").format(
                  success.transactions!.rows![j].payedOn,
                );
                if (date == temp) {
                  transactionsList.add(
                    success.transactions!.rows![j],
                  );
                }
              }
              if (list.isEmpty || list.containsKey(date)) {
                list.addEntries(
                  {
                    date: transactionsList,
                  }.entries,
                );
              }
            }
            emit(
              state.copyWith(
                transactionListResponseModel: success,
                isLoading: false,
                list: list,
                showShimmer: false,
              ),
            );
          }
        }
      },
      (r) {
        emit(
          state.copyWith(
            status: DashboardStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _resetSelectedCard(ResetSelectedCard event, emit) {
    var myStudentsResponseModel = MyStudentsResponseModel.empty();
    myStudentsResponseModel = state.myStudentsResponseModel;
    if (myStudentsResponseModel.students != null &&
        myStudentsResponseModel.students!.isNotEmpty) {
      for (int i = 0; i < myStudentsResponseModel.students!.length; i++) {
        myStudentsResponseModel.students![i].isSelected = false;
      }
      emit(
        state.copyWith(
          myStudentsResponseModel: myStudentsResponseModel,
        ),
      );
    }
  }

  _updatedSelectedCard(UpdatedSelectedCard event, emit) {
    var myStudentsResponseModel = MyStudentsResponseModel.empty();
    myStudentsResponseModel = state.myStudentsResponseModel;
    for (int i = 0; i < myStudentsResponseModel.students!.length; i++) {
      if (myStudentsResponseModel.students![i].id == event.id) {
        myStudentsResponseModel.students![i].isSelected = true;
      } else {
        myStudentsResponseModel.students![i].isSelected = false;
      }
    }

    emit(
      state.copyWith(
        myStudentsResponseModel: myStudentsResponseModel,
      ),
    );
  }
}
