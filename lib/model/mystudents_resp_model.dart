// To parse this JSON data, do
//
//     final myStudentsRespModel = myStudentsRespModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyStudentsRespModel myStudentsRespModelFromJson(String str) => MyStudentsRespModel.fromJson(json.decode(str));

String myStudentsRespModelToJson(MyStudentsRespModel data) => json.encode(data.toJson());

class MyStudentsRespModel {
  MyStudentsRespModel({
    required this.status,
    required this.students,
  });

  bool status;
  List<StudentElement>? students;

  factory MyStudentsRespModel.fromJson(Map<String, dynamic> json) => MyStudentsRespModel(
    status: json["status"],
    students: List<StudentElement>.from(json["students"].map((x) => StudentElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "students": List<dynamic>.from(students!.map((x) => x.toJson())),
  };
}

class StudentElement {
  StudentElement({
    required this.id,
    required this.parentId,
    required this.studentId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
  });

  int id;
  int parentId;
  int studentId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  StudentStudent? student;

  factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
    id: json["id"],
    parentId: json["parentId"],
    studentId: json["studentId"],
    deletedAt: json["deletedAt"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    student: json["student"] == null ? null : StudentStudent.fromJson(json["student"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parentId": parentId,
    "studentId": studentId,
    "deletedAt": deletedAt,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "student": student == null ? null : student!.toJson(),
  };
}

class StudentStudent {
  StudentStudent({
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
    required this.school,
  });

  DateTime dob;
  DateTime admissionDate;
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
  String? guardianFirstName;
  String? guardianLastName;
  String? guardianGender;
  String? guardianEmiratesId;
  String? guardianNationality;
  String? guardianReligion;
  String? area;
  String? region;
  String? streetAddress;
  String? email;
  String? phoneNumber;
  String? otherNumber;
  dynamic profile;
  String? religion;
  String? nationality;
  String? gender;
  DateTime? dueDate;
  String? file;
  String? privacy;
  DateTime? createdAt;
  DateTime? updatedAt;
  School? school;

  factory StudentStudent.fromJson(Map<String, dynamic> json) => StudentStudent(
    dob: DateTime.parse(json["dob"]),
    admissionDate: DateTime.parse(json["admissionDate"]),
    id: json["id"],
    studentRegNo: json["studentRegNo"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    grade: json["grade"],
    parentEmiratesId: json["parentEmiratesId"],
    parentPhoneNumber: json["parentPhoneNumber"] == null ? null : json["parentPhoneNumber"],
    deletedAt: json["deletedAt"],
    schoolId: json["schoolId"],
    totalBalanceAmount: json["total_balance_amount"],
    guardianFirstName: json["guardianFirstName"] == null ? null : json["guardianFirstName"],
    guardianLastName: json["guardianLastName"] == null ? null : json["guardianLastName"],
    guardianGender: json["guardianGender"] == null ? null : json["guardianGender"],
    guardianEmiratesId: json["guardianEmiratesId"] == null ? null : json["guardianEmiratesId"],
    guardianNationality: json["guardianNationality"] == null ? null : json["guardianNationality"],
    guardianReligion: json["guardianReligion"] == null ? null : json["guardianReligion"],
    area: json["area"] == null ? null : json["area"],
    region: json["region"] == null ? null : json["region"],
    streetAddress: json["streetAddress"] == null ? null : json["streetAddress"],
    email: json["email"] == null ? null : json["email"],
    phoneNumber: json["phoneNumber"],
    otherNumber: json["otherNumber"] == null ? null : json["otherNumber"],
    profile: json["profile"],
    religion: json["religion"] == null ? null : json["religion"],
    nationality: json["nationality"] == null ? null : json["nationality"],
    gender: json["gender"] == null ? null : json["gender"],
    dueDate: json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
    file: json["file"] == null ? null : json["file"],
    privacy: json["privacy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    school: School.fromJson(json["school"]),
  );

  Map<String, dynamic> toJson() => {
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "admissionDate": "${admissionDate.year.toString().padLeft(4, '0')}-${admissionDate.month.toString().padLeft(2, '0')}-${admissionDate.day.toString().padLeft(2, '0')}",
    "id": id,
    "studentRegNo": studentRegNo,
    "firstName": firstName,
    "lastName": lastName,
    "grade": grade,
    "parentEmiratesId": parentEmiratesId,
    "parentPhoneNumber": parentPhoneNumber == null ? null : parentPhoneNumber,
    "deletedAt": deletedAt,
    "schoolId": schoolId,
    "total_balance_amount": totalBalanceAmount,
    "guardianFirstName": guardianFirstName == null ? null : guardianFirstName,
    "guardianLastName": guardianLastName == null ? null : guardianLastName,
    "guardianGender": guardianGender == null ? null : guardianGender,
    "guardianEmiratesId": guardianEmiratesId == null ? null : guardianEmiratesId,
    "guardianNationality": guardianNationality == null ? null : guardianNationality,
    "guardianReligion": guardianReligion == null ? null : guardianReligion,
    "area": area == null ? null : area,
    "region": region == null ? null : region,
    "streetAddress": streetAddress == null ? null : streetAddress,
    "email": email == null ? null : email,
    "phoneNumber": phoneNumber,
    "otherNumber": otherNumber == null ? null : otherNumber,
    "profile": profile,
    "religion": religion == null ? null : religion,
    "nationality": nationality == null ? null : nationality,
    "gender": gender == null ? null : gender,
    "dueDate": dueDate == null ? null : "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    "file": file == null ? null : file,
    "privacy": privacy,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "school": school!.toJson(),
  };
}

class School {
  School({
    required this.id,
    required this.name,
    required this.deletedAt,
    required this.addedBy,
    required this.address,
    required this.description,
    required this.vat,
    required this.paynestFee,
    required this.apiKey,
    required this.merchantId,
    required this.file,
    required this.privacy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic deletedAt;
  dynamic addedBy;
  String address;
  String description;
  double vat;
  int paynestFee;
  String? apiKey;
  int? merchantId;
  String? file;
  String? privacy;
  DateTime createdAt;
  DateTime updatedAt;

  factory School.fromJson(Map<String, dynamic> json) => School(
    id: json["id"],
    name: json["name"],
    deletedAt: json["deletedAt"],
    addedBy: json["addedBy"],
    address: json["address"],
    description: json["description"],
    vat: json["vat"].toDouble(),
    paynestFee: json["paynestFee"],
    apiKey: json["APIKey"] == null ? null : json["APIKey"],
    merchantId: json["merchantId"],
    file: json["file"] == null ? null : json["file"],
    privacy: json["privacy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deletedAt": deletedAt,
    "addedBy": addedBy,
    "address": address,
    "description": description,
    "vat": vat,
    "paynestFee": paynestFee,
    "APIKey": apiKey == null ? null : apiKey,
    "merchantId": merchantId,
    "file": file == null ? null : file,
    "privacy": privacy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
