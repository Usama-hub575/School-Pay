// To parse this JSON data, do
//
//     final verifyPinResModel = verifyPinResModelFromJson(jsonString);

import 'dart:convert';

VerifyPinResModel verifyPinResModelFromJson(String str) => VerifyPinResModel.fromJson(json.decode(str));

String verifyPinResModelToJson(VerifyPinResModel data) => json.encode(data.toJson());

class VerifyPinResModel {
  VerifyPinResModel({
    required this.status,
    required this.message,
  });

  bool status;
  String? message;

  factory VerifyPinResModel.fromJson(Map<String, dynamic> json) => VerifyPinResModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
