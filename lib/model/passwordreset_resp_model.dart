// To parse this JSON data, do
//
//     final passwordResetRespModel = passwordResetRespModelFromJson(jsonString);

import 'dart:convert';

PasswordResetRespModel passwordResetRespModelFromJson(String str) => PasswordResetRespModel.fromJson(json.decode(str));

String passwordResetRespModelToJson(PasswordResetRespModel data) => json.encode(data.toJson());

class PasswordResetRespModel {
  PasswordResetRespModel({
    required this.status,
    required this.message,
  });

  bool status;
  String? message;

  factory PasswordResetRespModel.fromJson(Map<String, dynamic> json) => PasswordResetRespModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
