part of 'dashboard_bloc.dart';

// ignore: must_be_immutable
class DashboardState extends Equatable {
  DashboardStatus status = DashboardStatus.init;
  String errorMessage = '';
  bool isBioMetricEnable = false;
  var list = {};
  bool isLoading = true;
  String firstName = '';
  String lastName = '';
  bool showShimmer = false;
  List<TransactionsRow> transactionsList = [];
  List<StudentData> students = [];
  TransactionListResponseModel transactionListResponseModel =
      TransactionListResponseModel.empty();
  RegisterResponseModel registerResponseModel = RegisterResponseModel.empty();

  DashboardState({
    this.status = DashboardStatus.init,
    this.errorMessage = '',
    this.isBioMetricEnable = false,
    this.list = const {},
    this.showShimmer = false,
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
    String? errorMessage,
    bool? isBioMetricEnable,
    DashboardStatus? status,
    bool? showShimmer,
    var list,
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
      list: list ?? this.list,
      isBioMetricEnable: isBioMetricEnable ?? this.isBioMetricEnable,
      showShimmer: showShimmer ?? this.showShimmer,
      errorMessage: errorMessage ?? this.errorMessage,
      students: students ?? this.students,
      isLoading: isLoading ?? this.isLoading,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props => [
        isBioMetricEnable,
        errorMessage,
        showShimmer,
        list,
        registerResponseModel,
        students,
        isLoading,
        status,
      ];
}
