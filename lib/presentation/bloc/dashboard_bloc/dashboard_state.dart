part of 'dashboard_bloc.dart';

// ignore: must_be_immutable
class DashboardState extends Equatable {
  DashboardStatus status = DashboardStatus.init;
  String errorMessage = '';
  bool isBioMetricEnable = false;
  var list = {};
  bool isLoading = true;
  String firstName = '';
  String email = '';
  String phoneNumber = '';
  String lastName = '';
  bool showShimmer = false;
  MyStudentsResponseModel myStudentsResponseModel =
      MyStudentsResponseModel.empty();
  ParentStudentResponse parentStudentResponse = ParentStudentResponse();
  List<TransactionsRow> transactionsList = [];
  List<StudentData> students = [];
  TransactionListResponseModel transactionListResponseModel =
      TransactionListResponseModel.empty();

  DashboardState({
    this.status = DashboardStatus.init,
    this.errorMessage = '',
    this.isBioMetricEnable = false,
    this.list = const {},
    this.email = '',
    this.phoneNumber = '',
    this.showShimmer = false,
    required this.parentStudentResponse,
    required this.myStudentsResponseModel,
    required this.transactionListResponseModel,
    this.isLoading = true,
    this.firstName = '',
    this.lastName = '',
    this.students = const [],
  });

  DashboardState copyWith({
    RegisterResponseModel? registerResponseModel,
    TransactionListResponseModel? transactionListResponseModel,
    ParentStudentResponse? parentStudentResponse,
    MyStudentsResponseModel? myStudentsResponseModel,
    String? errorMessage,
    String? email,
    String? phoneNumber,
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
      myStudentsResponseModel:
          myStudentsResponseModel ?? this.myStudentsResponseModel,
      transactionListResponseModel:
          transactionListResponseModel ?? this.transactionListResponseModel,
      status: status ?? this.status,
      email: email ?? this.email,
      parentStudentResponse:
          parentStudentResponse ?? this.parentStudentResponse,
      phoneNumber: phoneNumber ?? this.phoneNumber,
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
        parentStudentResponse,
        myStudentsResponseModel,
        errorMessage,
        phoneNumber,
        email,
        showShimmer,
        list,
        students,
        isLoading,
        status,
      ];
}
