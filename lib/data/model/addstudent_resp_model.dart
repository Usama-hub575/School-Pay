// To parse this JSON data, do
//
//     final addStudentRespModel = addStudentRespModelFromJson(jsonString);

import 'dart:convert';

AddStudentRespModel addStudentRespModelFromJson(String str) =>
    AddStudentRespModel.fromJson(json.decode(str));

String addStudentRespModelToJson(AddStudentRespModel data) =>
    json.encode(data.toJson());

class AddStudentRespModel {
  AddStudentRespModel({
    required this.status,
    required this.message,
  });

  bool status;
  String? message;

  factory AddStudentRespModel.fromJson(Map<String, dynamic> json) =>
      AddStudentRespModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
