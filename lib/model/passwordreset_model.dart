// To parse this JSON data, do
//
//     final passwordResetModel = passwordResetModelFromJson(jsonString);

import 'dart:convert';

PasswordResetModel passwordResetModelFromJson(String str) => PasswordResetModel.fromJson(json.decode(str));

String passwordResetModelToJson(PasswordResetModel data) => json.encode(data.toJson());

class PasswordResetModel {
  PasswordResetModel({
    required this.parentId,
    required this.oldPassword,
    required this.newPassword,
  });

  String parentId;
  String oldPassword;
  String newPassword;

  factory PasswordResetModel.fromJson(Map<String, dynamic> json) => PasswordResetModel(
    parentId: json["parentId"],
    oldPassword: json["oldPassword"],
    newPassword: json["newPassword"],
  );

  Map<String, dynamic> toJson() => {
    "parentId": parentId,
    "oldPassword": oldPassword,
    "newPassword": newPassword,
  };
}
