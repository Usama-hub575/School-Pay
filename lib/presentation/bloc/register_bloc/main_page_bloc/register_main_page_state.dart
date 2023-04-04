part of 'register_main_page_bloc.dart';

// ignore: must_be_immutable
class RegisterMainPageState extends Equatable {
  RegisterMainPageStatus status = RegisterMainPageStatus.init;
  bool terms = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String successMessage = '';
  String mainPageErrorMessage = '';

  RegisterMainPageState({
    this.status = RegisterMainPageStatus.init,
    this.successMessage = '',
    this.terms = false,
    this.obscureConfirmPassword = true,
    this.obscurePassword = true,
    this.mainPageErrorMessage = '',
  });

  RegisterMainPageState copyWith({
    RegisterMainPageStatus? status,
    String? successMessage,
    bool? terms,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    String? mainPageErrorMessage,
  }) {
    return RegisterMainPageState(
      mainPageErrorMessage: mainPageErrorMessage ?? this.mainPageErrorMessage,
      status: status ?? this.status,
      successMessage: successMessage ?? this.successMessage,
      terms: terms ?? this.terms,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  @override
  List<Object?> get props => [
        mainPageErrorMessage,
        obscurePassword,
        successMessage,
        obscureConfirmPassword,
        terms,
        status,
      ];
}
