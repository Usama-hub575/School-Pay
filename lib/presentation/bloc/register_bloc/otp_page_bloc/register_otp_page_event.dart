part of 'register_otp_page_bloc.dart';

abstract class RegisterOTPPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckCode extends RegisterOTPPageEvent {
  final bool isCodeComplete;

  CheckCode({
    required this.isCodeComplete,
  });
}

class OTPLoading extends RegisterOTPPageEvent {}

class VerifyOTP extends RegisterOTPPageEvent {
  final String phoneNumber;
  final String otpCode;

  VerifyOTP({
    required this.otpCode,
    required this.phoneNumber,
  });
}

class StartTimer extends RegisterOTPPageEvent {}
