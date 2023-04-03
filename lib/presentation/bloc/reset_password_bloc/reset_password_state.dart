part of 'reset_password_bloc.dart';

// ignore: must_be_immutable
class ResetPasswordState extends Equatable {
  ResetPasswordStatus status = ResetPasswordStatus.init;
  String errorMessage = '';
  bool isObscure = true;
  bool confirmPassword = true;
  bool codeComplete = false;
  String email = "";
  String otp = '';

  ResetPasswordState({
    this.status = ResetPasswordStatus.init,
    this.isObscure = true,
    this.confirmPassword = true,
    this.codeComplete = false,
    this.email = '',
    this.otp = '',
    this.errorMessage = '',
  });

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    bool? isObscure,
    String? errorMessage,
    bool? confirmPassword,
    bool? codeComplete,
    String? email,
    String? otp,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isObscure: isObscure ?? this.isObscure,
      codeComplete: codeComplete ?? this.codeComplete,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        email,
        confirmPassword,
        isObscure,
        codeComplete,
        otp,
      ];
}
