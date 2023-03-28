part of 'register_page_view_bloc.dart';

// ignore: must_be_immutable
class RegisterPageViewState extends Equatable {
  RegisterPageViewStatus status = RegisterPageViewStatus.init;
  bool buttonEnable = false;
  int currentIndex = 0;
  String email = '';
  String password = '';
  String phoneNumber = '';
  String phoneCode = '';

  RegisterPageViewState({
    this.status = RegisterPageViewStatus.init,
    this.buttonEnable = false,
    this.currentIndex = 0,
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    this.phoneCode = '',
  });

  RegisterPageViewState copyWith({
    RegisterPageViewStatus? status,
    bool? buttonEnable,
    int? currentIndex,
    String? email,
    String? password,
    String? phoneNumber,
    String? phoneCode,
  }) {
    return RegisterPageViewState(
      status: status ?? this.status,
      email: email ?? this.email,
      buttonEnable: buttonEnable ?? this.buttonEnable,
      currentIndex: currentIndex ?? this.currentIndex,
      password: password ?? this.password,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        buttonEnable,
        currentIndex,
        password,
        phoneCode,
        phoneNumber,
      ];
}
