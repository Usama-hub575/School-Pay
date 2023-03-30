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
  }

  DashboardUseCase dashboardUseCase;

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
        ;
        emit(
          state.copyWith(
            students: success.students,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: DashboardStatus.init,
          ),
        );
      },
    );
  }

  _fetchTransactions(FetchTransactions event, emit) async {
    final response = await dashboardUseCase.fetchTransactions();
    response.fold(
      (success) {
        emit(
          state.copyWith(
            transactionListResponseModel: success,
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: DashboardStatus.init,
          ),
        );
      },
    );
  }
}
