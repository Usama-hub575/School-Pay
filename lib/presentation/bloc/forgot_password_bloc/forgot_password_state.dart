part of 'forgot_password_bloc.dart';

// ignore: must_be_immutable
class ForgotPasswordState extends Equatable {
  ForgotPasswordStatus status = ForgotPasswordStatus.init;
  String errorMessage = '';

  ForgotPasswordState({
    this.status = ForgotPasswordStatus.init,
    this.errorMessage = '',
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
