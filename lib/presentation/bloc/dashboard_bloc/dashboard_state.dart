part of 'dashboard_bloc.dart';

// ignore: must_be_immutable
class DashboardState extends Equatable {
  DashboardStatus status = DashboardStatus.init;
  String errorMessage = '';
  bool isBioMetricEnable = false;
  var list = {};
  bool isLoading = true;
  // String firstName = '';
  String email = '';
  String phoneNumber = '';
  // String lastName = '';
  bool showShimmer = false;
  List<StudentData> searchResult = [];
  MyStudentsResponseModel myStudentsResponseModel =
      MyStudentsResponseModel.empty();
  SingleStudentResponseModel singleStudentResponseModel =
      SingleStudentResponseModel();
  List<StudentData> students = [];
  TransactionListResponseModel transactionListResponseModel =
      TransactionListResponseModel.empty();

  DashboardState({
    this.status = DashboardStatus.init,
    this.errorMessage = '',
    this.isBioMetricEnable = false,
    this.list = const {},
    this.searchResult = const [],
    this.email = '',
    this.phoneNumber = '',
    this.showShimmer = false,
    required this.singleStudentResponseModel,
    required this.myStudentsResponseModel,
    required this.transactionListResponseModel,
    this.isLoading = true,
    // this.firstName = '',
    // this.lastName = '',
    this.students = const [],
  });

  DashboardState copyWith({
    RegisterResponseModel? registerResponseModel,
    TransactionListResponseModel? transactionListResponseModel,
    SingleStudentResponseModel? singleStudentResponseModel,
    MyStudentsResponseModel? myStudentsResponseModel,
    String? errorMessage,
    List<StudentData>? searchResult,
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
      singleStudentResponseModel:
          singleStudentResponseModel ?? this.singleStudentResponseModel,
      searchResult: searchResult ?? this.searchResult,
      transactionListResponseModel:
          transactionListResponseModel ?? this.transactionListResponseModel,
      status: status ?? this.status,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      list: list ?? this.list,
      isBioMetricEnable: isBioMetricEnable ?? this.isBioMetricEnable,
      showShimmer: showShimmer ?? this.showShimmer,
      errorMessage: errorMessage ?? this.errorMessage,
      students: students ?? this.students,
      isLoading: isLoading ?? this.isLoading,
      // firstName: firstName ?? this.firstName,
      // lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props => [
        // firstName,
        // lastName,
        isBioMetricEnable,
        singleStudentResponseModel,
        searchResult,
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
