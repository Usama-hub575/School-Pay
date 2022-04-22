// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OTPVerifyResModel oTPVerifyResModelFromJson(String str) => OTPVerifyResModel.fromJson(json.decode(str));

String oTPVerifyResModelToJson(OTPVerifyResModel data) => json.encode(data.toJson());

class OTPVerifyResModel {
  OTPVerifyResModel({
    required this.message,
    required this.type,
  });

  String? message;
  String? type;

  factory OTPVerifyResModel.fromJson(Map<String, dynamic> json) => OTPVerifyResModel(
    message: json["message"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "type": type,
  };
}
