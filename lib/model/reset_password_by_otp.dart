import 'dart:convert';

ResetPasswordByOTP resetPasswordByOTP(String str) => ResetPasswordByOTP.fromJson(json.decode(str));

String resetPasswordByOTPModelToJson(ResetPasswordByOTP data) => json.encode(data.toJson());

class ResetPasswordByOTP {
  ResetPasswordByOTP({
    required this.email,
    required this.otpValue,
    required this.password,
  });

  String email;
  String otpValue;
  String password;

  factory ResetPasswordByOTP.fromJson(Map<String, dynamic> json) => ResetPasswordByOTP(
    email: json["email"],
    otpValue: json["otp"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "otpValue": otpValue,
    "password": password,
  };
}