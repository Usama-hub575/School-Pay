part of 'reset_password_bloc.dart';

// ignore: must_be_immutable
class ResetPasswordState extends Equatable {
  ResetPasswordStatus status = ResetPasswordStatus.init;
  String errorMessage = '';
  bool newPasswordObscure = true;
  bool confirmPasswordObscure = true;
  bool isCodeComplete = false;
  String email = "";
  String otp = '';

  ResetPasswordState({
    this.status = ResetPasswordStatus.init,
    this.newPasswordObscure = true,
    this.confirmPasswordObscure = true,
    this.isCodeComplete = false,
    this.email = '',
    this.otp = '',
    this.errorMessage = '',
  });

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    bool? newPasswordObscure,
    String? errorMessage,
    bool? confirmPasswordObscure,
    bool? isCodeComplete,
    String? email,
    String? otp,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      confirmPasswordObscure:
          confirmPasswordObscure ?? this.confirmPasswordObscure,
      newPasswordObscure: newPasswordObscure ?? this.newPasswordObscure,
      isCodeComplete: isCodeComplete ?? this.isCodeComplete,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        email,
        confirmPasswordObscure,
        newPasswordObscure,
        isCodeComplete,
        otp,
      ];
}
