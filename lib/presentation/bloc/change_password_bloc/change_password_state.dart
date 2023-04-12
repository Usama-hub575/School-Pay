part of 'change_password_bloc.dart';

// ignore: must_be_immutable
class ChangePasswordState extends Equatable {
  ChangePasswordStatus status = ChangePasswordStatus.init;
  bool oldPasswordObscure = true;
  bool newPasswordObscure = true;
  bool confirmPasswordObscure = true;
  String errorMessage = '';

  ChangePasswordState({
    this.status = ChangePasswordStatus.init,
    this.oldPasswordObscure = true,
    this.newPasswordObscure = true,
    this.confirmPasswordObscure = true,
    this.errorMessage = '',
  });

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    bool? oldPasswordObscure,
    bool? newPasswordObscure,
    bool? confirmPasswordObscure,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      confirmPasswordObscure:
          confirmPasswordObscure ?? this.confirmPasswordObscure,
      newPasswordObscure: newPasswordObscure ?? this.newPasswordObscure,
      oldPasswordObscure: oldPasswordObscure ?? this.oldPasswordObscure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        oldPasswordObscure,
        newPasswordObscure,
        confirmPasswordObscure,
      ];
}
