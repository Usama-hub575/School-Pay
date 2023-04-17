part of 'pay_now_bloc.dart';

// ignore: must_be_immutable
class PayNowState extends Equatable {
  PayNowStatus status = PayNowStatus.init;
  String errorMessage = '';
  String payAbleAmount = '0';
  bool isLoading = false;
  var isSandbox = true;
  var appToken = "";
  var customerId = "";
  var reconnectId = "";
  var paymentDestinationId = "";
  var paymentIntentId = "";
  StudentData studentData = StudentData.empty();
  List<StudentData> students = [];
  List<Permission> permissions = [
    Permission.identity,
    Permission.transactions,
    Permission.balance,
    Permission.accounts
  ];

  PayNowState({
    this.status = PayNowStatus.init,
    this.payAbleAmount = '0',
    required this.studentData,
    this.students = const [],
    this.permissions = const [
      Permission.identity,
      Permission.transactions,
      Permission.balance,
      Permission.accounts
    ],
    this.isLoading = false,
    this.errorMessage = '',
    this.appToken = "",
    this.isSandbox = false,
    this.customerId = "",
    this.reconnectId = "",
    this.paymentDestinationId = "",
    this.paymentIntentId = "",
  });

  PayNowState copyWith({
    PayNowStatus? status,
    String? errorMessage,
    StudentData? studentData,
    List<StudentData>? students,
    List<Permission>? permissions,
    String? payAbleAmount,
    bool? isLoading,
    var isSandbox,
    var appToken,
    var customerId,
    var reconnectId,
    var paymentDestinationId,
    var paymentIntentId,
  }) {
    return PayNowState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      permissions: permissions ?? this.permissions,
      students: students ?? this.students,
      studentData: studentData ?? this.studentData,
      isSandbox: isSandbox ?? this.isSandbox,
      isLoading: isLoading ?? this.isLoading,
      payAbleAmount: payAbleAmount ?? this.payAbleAmount,
      appToken: appToken ?? this.appToken,
      customerId: customerId ?? this.customerId,
      paymentDestinationId: paymentDestinationId ?? this.paymentDestinationId,
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
      reconnectId: reconnectId ?? this.reconnectId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        appToken,
        students,
        studentData,
        isSandbox,
        permissions,
        isLoading,
        payAbleAmount,
        customerId,
        paymentIntentId,
        paymentDestinationId,
        reconnectId,
      ];
}
