// To parse this JSON data, do
//
//     final addStudentModel = addStudentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddStudentModel addStudentModelFromJson(String str) => AddStudentModel.fromJson(json.decode(str));

String addStudentModelToJson(AddStudentModel data) => json.encode(data.toJson());

class AddStudentModel {
  AddStudentModel({
    required this.parentId,
    required this.dob,
    required this.studentId,
    required this.studentRegNo,
  });

  String parentId;
  String dob;
  String studentId;
  String studentRegNo;

  factory AddStudentModel.fromJson(Map<String, dynamic> json) => AddStudentModel(
    parentId: json["parentId"],
    dob: json["dob"],
    studentId: json["studentId"],
    studentRegNo: json["studentRegNo"],
  );

  Map<String, dynamic> toJson() => {
    "parentId": parentId,
    "dob": dob,
    "studentId": studentId,
    "studentRegNo": studentRegNo,
  };
}
