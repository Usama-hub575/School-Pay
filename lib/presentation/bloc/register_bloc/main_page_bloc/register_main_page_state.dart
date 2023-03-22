part of 'register_main_page_bloc.dart';

// ignore: must_be_immutable
class RegisterMainPageState extends Equatable {
  RegisterMainPageStatus status = RegisterMainPageStatus.init;
  bool terms = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String errorMessage = '';

  RegisterMainPageState({
    this.status = RegisterMainPageStatus.init,
    this.terms = false,
    this.obscureConfirmPassword = true,
    this.obscurePassword = true,
    this.errorMessage = '',
  });

  RegisterMainPageState copyWith({
    RegisterMainPageStatus? status,
    bool? terms,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    String? errorMessage,
  }) {
    return RegisterMainPageState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      terms: terms ?? this.terms,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        obscurePassword,
        obscureConfirmPassword,
        terms,
        status,
      ];
}
