part of 'register_otp_page_bloc.dart';

abstract class RegisterOTPPageBaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckCode extends RegisterOTPPageBaseEvent {
  final bool codeValue;

  CheckCode({
    required this.codeValue,
  });
}
