part of 'register_main_page_bloc.dart';

class RegisterMainPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckBox extends RegisterMainPageEvent {}

class RegisterMainPageLoading extends RegisterMainPageEvent {}

class RegisterToggle extends RegisterMainPageEvent {
  final String toggleStatus;

  RegisterToggle({
    required this.toggleStatus,
  });
}

class Loaded extends RegisterMainPageEvent {}

class SendOTP extends RegisterMainPageEvent {
  final String email;
  final String userPhoneNumber;
  final String dialCode;

  SendOTP({
    required this.userPhoneNumber,
    required this.dialCode,
    required this.email,
  });
}
