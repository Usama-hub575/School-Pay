part of 'dashboard_bloc.dart';

// ignore: must_be_immutable
class DashboardState extends Equatable {
  DashboardStatus status = DashboardStatus.init;
  bool isLoading = true;
  String firstName = '';
  String lastName = '';
  List<StudentData> students = [];
  TransactionListResponseModel transactionListResponseModel =
      TransactionListResponseModel.empty();
  RegisterResponseModel registerResponseModel = RegisterResponseModel.empty();

  DashboardState({
    this.status = DashboardStatus.init,
    required this.transactionListResponseModel,
    required this.registerResponseModel,
    this.isLoading = true,
    this.firstName = '',
    this.lastName = '',
    this.students = const [],
  });

  DashboardState copyWith({
    RegisterResponseModel? registerResponseModel,
    TransactionListResponseModel? transactionListResponseModel,
    DashboardStatus? status,
    List<StudentData>? students,
    bool? isLoading,
    String? firstName,
    String? lastName,
  }) {
    return DashboardState(
      transactionListResponseModel:
          transactionListResponseModel ?? this.transactionListResponseModel,
      registerResponseModel:
          registerResponseModel ?? this.registerResponseModel,
      status: status ?? this.status,
      students: students ?? this.students,
      isLoading: isLoading ?? this.isLoading,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props => [
        transactions,
        registerResponseModel,
        students,
        isLoading,
        status,
      ];
}
