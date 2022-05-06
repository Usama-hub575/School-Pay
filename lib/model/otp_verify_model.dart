// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'dart:convert';

OtpVerifyModel otpVerifyModelFromJson(String str) => OtpVerifyModel.fromJson(json.decode(str));

String otpVerifyModelToJson(OtpVerifyModel data) => json.encode(data.toJson());

class OtpVerifyModel {
  OtpVerifyModel({
    required this.phone,
    required this.otp,
  });

  String phone;
  String otp;

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
    phone: json["phone"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "otp": otp,
  };
}
