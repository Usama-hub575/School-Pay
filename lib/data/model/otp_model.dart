// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    required this.email,
    required this.phone,
    required this.dailCode,
  });
  String email;
  String phone;
  String dailCode;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    email: json["email"],
    phone: json["phone"],
    dailCode: '',
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    'dialCode': dailCode

  };
}
