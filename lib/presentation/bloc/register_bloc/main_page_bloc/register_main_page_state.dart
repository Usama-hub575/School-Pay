part of 'register_main_page_bloc.dart';

class RegisterMainPageBaseState extends Equatable {
  final RegisterMainPageStatus status;
  final bool terms;
  final bool isObscure;
  final bool loading;

  RegisterMainPageBaseState({
    this.status = RegisterMainPageStatus.init,
    this.terms = false,
    this.isObscure = true,
    this.loading = false,
  });

  RegisterMainPageBaseState copyWith({
    RegisterMainPageStatus? status,
    bool? terms,
    bool? isObscure,
    bool? loading,
  }) {
    return RegisterMainPageBaseState(
      status: status ?? this.status,
      terms: terms ?? this.terms,
      isObscure: isObscure ?? this.isObscure,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        isObscure,
        terms,
        status,
      ];
}
