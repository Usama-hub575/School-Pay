// To parse this JSON data, do
//
//     final updateBankRespModel = updateBankRespModelFromJson(jsonString);

import 'dart:convert';

UpdateBankRespModel updateBankRespModelFromJson(String str) => UpdateBankRespModel.fromJson(json.decode(str));

String updateBankRespModelToJson(UpdateBankRespModel data) => json.encode(data.toJson());

class UpdateBankRespModel {
  UpdateBankRespModel({
    required this.status,
    required this.message,
    required this.student,
    required this.paidOn,
    required this.referenceNo,
  });

  bool status;
  String message;
  Student? student;
  DateTime? paidOn;
  String? referenceNo;

  factory UpdateBankRespModel.fromJson(Map<String, dynamic> json) => UpdateBankRespModel(
    status: json["status"],
    message: json["message"],
    student: Student.fromJson(json["Student"]),
    paidOn: DateTime.parse(json["PaidOn"]),
    referenceNo: json["ReferenceNo"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Student": student!.toJson(),
    "PaidOn": paidOn!.toIso8601String(),
    "ReferenceNo": referenceNo,
  };
}

class Student {
  Student({
    required this.id,
    required this.studentRegNo,
    required this.firstName,
    required this.lastName,
    required this.grade,
    required this.parentEmiratesId,
    required this.parentPhoneNumber,
    required this.dob,
    required this.admissionDate,
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

  int id;
  String studentRegNo;
  String firstName;
  String lastName;
  String grade;
  String parentEmiratesId;
  String parentPhoneNumber;
  DateTime dob;
  DateTime admissionDate;
  dynamic deletedAt;
  int schoolId;
  String totalBalanceAmount;
  String guardianFirstName;
  String guardianLastName;
  String guardianGender;
  String guardianEmiratesId;
  String guardianNationality;
  String guardianReligion;
  String area;
  String region;
  String streetAddress;
  String email;
  String phoneNumber;
  String otherNumber;
  dynamic profile;
  String religion;
  String nationality;
  String gender;
  DateTime dueDate;
  dynamic file;
  String privacy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    studentRegNo: json["studentRegNo"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    grade: json["grade"],
    parentEmiratesId: json["parentEmiratesId"],
    parentPhoneNumber: json["parentPhoneNumber"],
    dob: DateTime.parse(json["dob"]),
    admissionDate: DateTime.parse(json["admissionDate"]),
    deletedAt: json["deletedAt"],
    schoolId: json["schoolId"],
    totalBalanceAmount: json["total_balance_amount"],
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
    phoneNumber: json["phoneNumber"],
    otherNumber: json["otherNumber"],
    profile: json["profile"],
    religion: json["religion"],
    nationality: json["nationality"],
    gender: json["gender"],
    dueDate: DateTime.parse(json["dueDate"]),
    file: json["file"],
    privacy: json["privacy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "studentRegNo": studentRegNo,
    "firstName": firstName,
    "lastName": lastName,
    "grade": grade,
    "parentEmiratesId": parentEmiratesId,
    "parentPhoneNumber": parentPhoneNumber,
    "dob": dob.toIso8601String(),
    "admissionDate": admissionDate.toIso8601String(),
    "deletedAt": deletedAt,
    "schoolId": schoolId,
    "total_balance_amount": totalBalanceAmount,
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
    "phoneNumber": phoneNumber,
    "otherNumber": otherNumber,
    "profile": profile,
    "religion": religion,
    "nationality": nationality,
    "gender": gender,
    "dueDate": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    "file": file,
    "privacy": privacy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
