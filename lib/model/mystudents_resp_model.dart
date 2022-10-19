// To parse this JSON data, do
//
//     final myStudentsRespModel = myStudentsRespModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';

MyStudentsRespModel myStudentsRespModelFromJson(String str) =>
    MyStudentsRespModel.fromJson(json.decode(str));

String myStudentsRespModelToJson(MyStudentsRespModel data) =>
    json.encode(data.toJson());

class MyStudentsRespModel {
  MyStudentsRespModel({
    required this.status,
    required this.students,
  });

  bool status;
  List<StudentElement>? students;

  static MyStudentsRespModel empty() {
    return MyStudentsRespModel(
      status: false,
      students: [],
    );
  }

  factory MyStudentsRespModel.fromJson(Map<String, dynamic> json) =>
      MyStudentsRespModel(
        status: json["status"],
        students: List<StudentElement>.from(
            json["students"].map((x) => StudentElement.fromJson(x))),
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
    required this.isSelected,
  });

  static StudentElement empty() {
    return StudentElement(
      id: 0,
      parentId: 0,
      studentId: 0,
      deletedAt: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      student: StudentStudent.empty(),
      isSelected: false,
    );
  }

  int id;
  int parentId;
  int studentId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  StudentStudent? student;
  bool isSelected;

  factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        id: json["id"] != null ? json["id"] : -1,
        parentId: json["parentId"] != null ? json["parentId"] : -1,
        studentId: json["studentId"] != null ? json["studentId"] : -1,
        deletedAt: json["deletedAt"] != null ? json["deletedAt"] : -1,
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        student: json["student"] == null
            ? StudentStudent.empty()
            : StudentStudent.fromJson(json["student"]),
        isSelected: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentId": parentId,
        "studentId": studentId,
        "deletedAt": deletedAt,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "student": student == null ? null : student!.toJson(),
        'isSelected': isSelected,
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
    required this.payeeType,
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
  dynamic totalBalanceAmount;
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
  String? payeeType;
  School? school;

  static StudentStudent empty() {
    return StudentStudent(
        dob: DateTime.now(),
        admissionDate: DateTime.now(),
        id: -1,
        studentRegNo: "",
        firstName: "",
        lastName: "",
        grade: "",
        parentEmiratesId: "",
        parentPhoneNumber: "",
        deletedAt: "",
        schoolId: -1,
        totalBalanceAmount: "0",
        guardianFirstName: "",
        guardianLastName: "",
        guardianGender: "",
        guardianEmiratesId: "",
        guardianNationality: "",
        guardianReligion: "",
        area: "",
        region: "",
        streetAddress: "",
        email: "",
        phoneNumber: "",
        otherNumber: "",
        profile: "",
        religion: "",
        nationality: "",
        gender: "",
        dueDate: DateTime.now(),
        file: "",
        privacy: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        payeeType: '',
        school: School.empty());
  }

  factory StudentStudent.fromJson(Map<String, dynamic> json) => StudentStudent(
        dob: json["dob"] != null ? DateTime.parse(json["dob"]) : DateTime.now(),
        admissionDate: json["admissionDate"] != null
            ? DateTime.parse(json["admissionDate"])
            : DateTime.now(),
        id: json["id"] != null ? json["id"] : -1,
        studentRegNo: json["studentRegNo"] != null ? json["studentRegNo"] : "-",
        firstName: json["firstName"] != null ? json["firstName"] : "-",
        lastName: json["lastName"] != null ? json["lastName"] : "-",
        grade: json["grade"] != null ? json["grade"] : "-",
        parentEmiratesId:
            json["parentEmiratesId"] != null ? json["parentEmiratesId"] : "-",
        parentPhoneNumber:
            json["parentPhoneNumber"] == null ? "-" : json["parentPhoneNumber"],
        deletedAt: json["deletedAt"] != null ? json["deletedAt"] : "",
        schoolId: json["schoolId"] != null ? json["schoolId"] : -1,
        totalBalanceAmount: json["total_balance_amount"] != null
            ? json["total_balance_amount"]
            : "-",
        guardianFirstName:
            json["guardianFirstName"] == null ? "-" : json["guardianFirstName"],
        guardianLastName:
            json["guardianLastName"] == null ? "-" : json["guardianLastName"],
        guardianGender:
            json["guardianGender"] == null ? "-" : json["guardianGender"],
        guardianEmiratesId: json["guardianEmiratesId"] == null
            ? "-"
            : json["guardianEmiratesId"],
        guardianNationality: json["guardianNationality"] == null
            ? "-"
            : json["guardianNationality"],
        guardianReligion:
            json["guardianReligion"] == null ? "-" : json["guardianReligion"],
        area: json["area"] == null ? "-" : json["area"],
        region: json["region"] == null ? "-" : json["region"],
        streetAddress:
            json["streetAddress"] == null ? "-" : json["streetAddress"],
        email: json["email"] == null ? "-" : json["email"],
        phoneNumber: json["phoneNumber"] != null ? json["phoneNumber"] : "-",
        otherNumber: json["otherNumber"] == null ? "-" : json["otherNumber"],
        profile: json["profile"] != null ? json["profile"] : "-",
        religion: json["religion"] == null ? "-" : json["religion"],
        nationality: json["nationality"] == null ? "-" : json["nationality"],
        gender: json["gender"] == null ? "-" : json["gender"],
        dueDate: json["dueDate"] == null
            ? DateTime.now()
            : DateTime.parse(json["dueDate"]),
        file: json["file"] == null ? "-" : json["file"],
        privacy: json["privacy"] != null ? json["privacy"] : "-",
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        payeeType: json['payeeType'] ?? '',
        school: json["school"] != null
            ? School.fromJson(json["school"])
            : School.empty(),
      );

  Map<String, dynamic> toJson() => {
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "admissionDate":
            "${admissionDate.year.toString().padLeft(4, '0')}-${admissionDate.month.toString().padLeft(2, '0')}-${admissionDate.day.toString().padLeft(2, '0')}",
        "id": id,
        "studentRegNo": studentRegNo,
        "firstName": firstName,
        "lastName": lastName,
        "grade": grade,
        "parentEmiratesId": parentEmiratesId,
        "parentPhoneNumber":
            parentPhoneNumber == null ? null : parentPhoneNumber,
        "deletedAt": deletedAt,
        "schoolId": schoolId,
        "total_balance_amount": totalBalanceAmount,
        "guardianFirstName":
            guardianFirstName == null ? null : guardianFirstName,
        "guardianLastName": guardianLastName == null ? null : guardianLastName,
        "guardianGender": guardianGender == null ? null : guardianGender,
        "guardianEmiratesId":
            guardianEmiratesId == null ? null : guardianEmiratesId,
        "guardianNationality":
            guardianNationality == null ? null : guardianNationality,
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
        "dueDate": dueDate == null
            ? null
            : "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "file": file == null ? null : file,
        "privacy": privacy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        'payeeType': payeeType,
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
  String? merchantId;
  String? file;
  String? privacy;
  DateTime createdAt;
  DateTime updatedAt;

  static School empty() {
    return School(
        id: -1,
        name: "-",
        deletedAt: "-",
        addedBy: "-",
        address: "-",
        description: "-",
        vat: -1.0,
        paynestFee: -1,
        apiKey: "-",
        merchantId: "-",
        file: "-",
        privacy: "-",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
  }

  factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"] ?? 0,
        name: json["name"] ?? "-",
        deletedAt: json["deletedAt"] ?? "-",
        addedBy: json["addedBy"] ?? "-",
        address: json["address"] ?? "-",
        description: json["description"] ?? "-",
        vat: double.parse(json["vat"]),
        paynestFee: json["paynestFee"] ?? 0,
        apiKey: json["APIKey"] == null ? "" : json["APIKey"],
        merchantId: json["merchantId"] ?? "-",
        file: json["file"] == null ? "-" : json["file"],
        privacy: json["privacy"] ?? "-",
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
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
