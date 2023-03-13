part of 'register_otp_page_bloc.dart';

class RegisterOTPPageState extends Equatable {
  final RegisterOTPPageStatus status;

  RegisterOTPPageState({
    this.status = RegisterOTPPageStatus.init,
  });

  RegisterOTPPageState copyWith({
    RegisterOTPPageStatus? status,
  }) {
    return RegisterOTPPageState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [];
}
