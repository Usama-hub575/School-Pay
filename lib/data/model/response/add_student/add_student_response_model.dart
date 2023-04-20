// To parse this JSON data, do
//
//     final addStudentRespModel = addStudentRespModelFromJson(jsonString);

import 'dart:convert';

AddStudentResponseModel addStudentResponseModelFromJson(String str) =>
    AddStudentResponseModel.fromJson(json.decode(str));

String addStudentResponseModelToJson(AddStudentResponseModel data) =>
    json.encode(data.toJson());

class AddStudentResponseModel {
  AddStudentResponseModel({
    required this.status,
    required this.message,
  });

  bool status;
  String? message;

  factory AddStudentResponseModel.fromJson(Map<String, dynamic> json) =>
      AddStudentResponseModel(
        status: json["status"],
        message: json["message"],
      );

  static AddStudentResponseModel empty() {
    return AddStudentResponseModel(
      status: false,
      message: null,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
