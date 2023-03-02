// To parse this JSON data, do
//
//     final registerRespModel = registerRespModelFromJson(jsonString);

import 'dart:convert';


ForgotPasswordRespModel forgotPasswordRespModelFromJson(String str) => ForgotPasswordRespModel.fromJson(json.decode(str));

String forgotPasswordRespModelToJson(ForgotPasswordRespModel data) => json.encode(data.toJson());

class ForgotPasswordRespModel {
  ForgotPasswordRespModel({
    required this.status,
    required this.message,

  });

  bool status;
  String? message;

  factory ForgotPasswordRespModel.fromJson(Map<String, dynamic> json) => ForgotPasswordRespModel(
    status: json["status"],
    message: json["message"],

  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}