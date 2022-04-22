// To parse this JSON data, do
//
//     final partialPayResModel = partialPayResModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PartialPayResModel partialPayResModelFromJson(String str) => PartialPayResModel.fromJson(json.decode(str));

String partialPayResModelToJson(PartialPayResModel data) => json.encode(data.toJson());

class PartialPayResModel {
  PartialPayResModel({
    required this.status,
    required this.message,
    required this.parent,
  });

  bool status;
  String? message;
  Parent? parent;

  factory PartialPayResModel.fromJson(Map<String, dynamic> json) => PartialPayResModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    parent: Parent.fromJson(json["parent"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "parent": parent == null ? null : parent!.toJson(),
  };
}

class Parent {
  Parent({
    required this.dob,
    required this.admissionDate,
    required this.id,
    required this.studentRegNo,
    required this.firstName,
    required this.lastName,
    required this.grade,
    required this.parentEmiratesId,
    required this.parentPhoneNumber,
    required this.deletedAt,
    required this.schoolId,
    required this.totalBalanceAmount,
    required this.guardianFirstName,
    required this.guardianLastName,
    required this.guardianGender,
    required this.guardianEmiratesId,
    required this.guardianNationality,
    required this.guardianReligion,
    required this.area,
    required this.region,
    required this.streetAddress,
    required this.email,
    required this.phoneNumber,
    required this.otherNumber,
    required this.profile,
    required this.religion,
    required this.nationality,
    required this.gender,
    required this.dueDate,
    required this.file,
    required this.privacy,
    required this.createdAt,
    required this.updatedAt,
  });

  DateTime? dob;
  DateTime? admissionDate;
  int id;
  String studentRegNo;
  String firstName;
  String lastName;
  String grade;
  String parentEmiratesId;
  dynamic parentPhoneNumber;
  dynamic deletedAt;
  int schoolId;
  String totalBalanceAmount;
  dynamic guardianFirstName;
  dynamic guardianLastName;
  dynamic guardianGender;
  dynamic guardianEmiratesId;
  dynamic guardianNationality;
  dynamic guardianReligion;
  dynamic area;
  dynamic region;
  dynamic streetAddress;
  dynamic email;
  String phoneNumber;
  dynamic otherNumber;
  dynamic profile;
  dynamic religion;
  dynamic nationality;
  dynamic gender;
  DateTime? dueDate;
  dynamic file;
  String privacy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    admissionDate: json["admissionDate"] == null ? null : DateTime.parse(json["admissionDate"]),
    id: json["id"] == null ? null : json["id"],
    studentRegNo: json["studentRegNo"] == null ? null : json["studentRegNo"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    grade: json["grade"] == null ? null : json["grade"],
    parentEmiratesId: json["parentEmiratesId"] == null ? null : json["parentEmiratesId"],
    parentPhoneNumber: json["parentPhoneNumber"],
    deletedAt: json["deletedAt"],
    schoolId: json["schoolId"] == null ? null : json["schoolId"],
    totalBalanceAmount: json["total_balance_amount"] == null ? null : json["total_balance_amount"],
    guardianFirstName: json["guardianFirstName"],
    guardianLastName: json["guardianLastName"],
    guardianGender: json["guardianGender"],
    guardianEmiratesId: json["guardianEmiratesId"],
    guardianNationality: json["guardianNationality"],
    guardianReligion: json["guardianReligion"],
    area: json["area"],
    region: json["region"],
    streetAddress: json["streetAddress"],
    email: json["email"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    otherNumber: json["otherNumber"],
    profile: json["profile"],
    religion: json["religion"],
    nationality: json["nationality"],
    gender: json["gender"],
    dueDate: json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
    file: json["file"],
    privacy: json["privacy"] == null ? null : json["privacy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "dob": dob == null ? null : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "admissionDate": admissionDate == null ? null : "${admissionDate!.year.toString().padLeft(4, '0')}-${admissionDate!.month.toString().padLeft(2, '0')}-${admissionDate!.day.toString().padLeft(2, '0')}",
    "id": id == null ? null : id,
    "studentRegNo": studentRegNo == null ? null : studentRegNo,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "grade": grade == null ? null : grade,
    "parentEmiratesId": parentEmiratesId == null ? null : parentEmiratesId,
    "parentPhoneNumber": parentPhoneNumber,
    "deletedAt": deletedAt,
    "schoolId": schoolId == null ? null : schoolId,
    "total_balance_amount": totalBalanceAmount == null ? null : totalBalanceAmount,
    "guardianFirstName": guardianFirstName,
    "guardianLastName": guardianLastName,
    "guardianGender": guardianGender,
    "guardianEmiratesId": guardianEmiratesId,
    "guardianNationality": guardianNationality,
    "guardianReligion": guardianReligion,
    "area": area,
    "region": region,
    "streetAddress": streetAddress,
    "email": email,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "otherNumber": otherNumber,
    "profile": profile,
    "religion": religion,
    "nationality": nationality,
    "gender": gender,
    "dueDate": dueDate == null ? null : "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    "file": file,
    "privacy": privacy == null ? null : privacy,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
