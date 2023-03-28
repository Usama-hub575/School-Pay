part of 'signin_bloc.dart';

// ignore: must_be_immutable
class SignInState extends Equatable {
  SignInStatus status;
  bool isObscure = true;
  bool isBioMetric = false;
  String password = '';
  String email = '';
  String message = '';

  SignInState({
    this.status = SignInStatus.init,
    this.isObscure = true,
    this.isBioMetric = false,
    this.email = '',
    this.password = '',
    this.message = '',
  });

  SignInState copyWith({
    SignInStatus? status,
    bool? isObscure,
    bool? isBioMetric,
    String? email,
    String? password,
    String? message,
  }) {
    return SignInState(
      status: status ?? this.status,
      isObscure: isObscure ?? this.isObscure,
      isBioMetric: isBioMetric ?? this.isBioMetric,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        isObscure,
        isBioMetric,
        email,
        password,
      ];
}
