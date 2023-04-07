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
            registerResponseModel: RegisterResponseModel.empty(),
          ),
        ) {
    on<FetchStudents>(_fetchStudents);
    on<FetchTransactions>(_fetchTransactions);
    on<GetName>(_getName);
    on<ShowShimmer>(_showShimmer);
    on<IsBioMetricEnable>(_isBioMetricEnable);
    on<RadioButtonOnTap>(_radioButtonOnTap);
  }

  DashboardUseCase dashboardUseCase;

  _isBioMetricEnable(IsBioMetricEnable event, emit) {
    emit(
      state.copyWith(
        isBioMetricEnable: dashboardUseCase.getBool(),
      ),
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
        firstName: dashboardUseCase.getFirstName(),
        lastName: dashboardUseCase.getLastName(),
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
}
