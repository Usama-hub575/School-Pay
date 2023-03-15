part of 'register_otp_page_bloc.dart';

// ignore: must_be_immutable
class RegisterOTPPageState extends Equatable {
  RegisterOTPPageStatus status;
  bool loading = false;
  bool code = false;
  int start = 60;
  bool timeUpFlag = false;

  RegisterOTPPageState({
    this.status = RegisterOTPPageStatus.init,
    this.loading = false,
    this.code = false,
    this.start = 60,
    this.timeUpFlag = false,
  });

  RegisterOTPPageState copyWith({
    RegisterOTPPageStatus? status,
    bool? loading,
    bool? code,
    int? start,
    bool? timeUpFlag,
  }) {
    return RegisterOTPPageState(
      status: status ?? this.status,
      loading: loading ?? this.loading,
      code: code ?? this.code,
      start: start ?? this.start,
      timeUpFlag: timeUpFlag ?? this.timeUpFlag,
    );
  }

  @override
  List<Object?> get props => [
        timeUpFlag,
        start,
        status,
        loading,
        code,
      ];
}
