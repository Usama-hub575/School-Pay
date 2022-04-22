// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    required this.phone,
  });

  String phone;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
  };
}
