part of 'register_otp_page_bloc.dart';

// ignore: must_be_immutable
class RegisterOTPPageState extends Equatable {
  RegisterOTPPageStatus status = RegisterOTPPageStatus.init;
  bool loading = false;
  bool isCodeComplete = false;
  int start = 60;
  bool timeUpFlag = false;
  String? otpErrorMessage = '';

  RegisterOTPPageState({
    this.status = RegisterOTPPageStatus.init,
    this.loading = false,
    this.otpErrorMessage = '',
    this.isCodeComplete = false,
    this.start = 60,
    this.timeUpFlag = false,
  });

  RegisterOTPPageState copyWith({
    RegisterOTPPageStatus? status,
    bool? loading,
    String? otpErrorMessage,
    bool? isCodeComplete,
    int? start,
    bool? timeUpFlag,
  }) {
    return RegisterOTPPageState(
      otpErrorMessage: otpErrorMessage ?? this.otpErrorMessage,
      status: status ?? this.status,
      loading: loading ?? this.loading,
      isCodeComplete: isCodeComplete ?? this.isCodeComplete,
      start: start ?? this.start,
      timeUpFlag: timeUpFlag ?? this.timeUpFlag,
    );
  }

  @override
  List<Object?> get props => [
        otpErrorMessage,
        timeUpFlag,
        start,
        status,
        loading,
        isCodeComplete,
      ];
}
