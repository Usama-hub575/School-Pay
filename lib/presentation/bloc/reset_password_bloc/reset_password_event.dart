part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPassword extends ResetPasswordEvent {}

class ResetPasswordToggle extends ResetPasswordEvent {}
