part of 'signin_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class OnPressed extends SignInEvent {
  final String email;
  final String password;

  const OnPressed({
    required this.email,
    required this.password,
  });
}

class BioMetric extends SignInEvent {}

class Initializer extends SignInEvent {}

class SignInToggle extends SignInEvent {}

class Loading extends SignInEvent {}

class NavigateToForgotPassword extends SignInEvent {}
