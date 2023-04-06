part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordLoading extends ForgotPasswordEvent {}

class HitForgotPassword extends ForgotPasswordEvent {
  final String email;

  HitForgotPassword({
    required this.email,
  });
}
