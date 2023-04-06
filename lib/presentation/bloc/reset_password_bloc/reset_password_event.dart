part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPassword extends ResetPasswordEvent {
  final String email;
  final String otp;
  final String password;

  ResetPassword({
    required this.email,
    required this.otp,
    required this.password,
  });
}

class ResetPasswordLoading extends ResetPasswordEvent {}

class ResetPasswordToggle extends ResetPasswordEvent {
  final String value;

  ResetPasswordToggle({
    required this.value,
  });
}

class IsCodeComplete extends ResetPasswordEvent {
  final bool isCodeComplete;
  final String pin;

  IsCodeComplete({
    required this.isCodeComplete,
    required this.pin,
  });
}
