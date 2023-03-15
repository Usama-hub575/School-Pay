// To parse this JSON data, do
//
//     final partialPayResModel = partialPayResModelFromJson(jsonString);

import 'dart:convert';

PartialPayResModel partialPayResModelFromJson(String str) =>
    PartialPayResModel.fromJson(json.decode(str));

String partialPayResModelToJson(PartialPayResModel data) =>
    json.encode(data.toJson());

class PartialPayResModel {
  PartialPayResModel({
    required this.status,
    required this.message,
    required this.parent,
  });

  bool status;
  String? message;
  Parent? parent;

  factory PartialPayResModel.fromJson(Map<String, dynamic> json) =>
      PartialPayResModel(
        status: json["status"],
        message: json["message"],
        parent: Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
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
        admissionDate: json["admissionDate"] == null
            ? null
            : DateTime.parse(json["admissionDate"]),
        id: json["id"],
        studentRegNo: json["studentRegNo"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        grade: json["grade"],
        parentEmiratesId: json["parentEmiratesId"],
        parentPhoneNumber: json["parentPhoneNumber"],
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
        dueDate:
            json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
        file: json["file"],
        privacy: json["privacy"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "dob": dob == null
            ? null
            : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "admissionDate": admissionDate == null
            ? null
            : "${admissionDate!.year.toString().padLeft(4, '0')}-${admissionDate!.month.toString().padLeft(2, '0')}-${admissionDate!.day.toString().padLeft(2, '0')}",
        "id": id,
        "studentRegNo": studentRegNo,
        "firstName": firstName,
        "lastName": lastName,
        "grade": grade,
        "parentEmiratesId": parentEmiratesId,
        "parentPhoneNumber": parentPhoneNumber,
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
        "dueDate": dueDate == null
            ? null
            : "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "file": file,
        "privacy": privacy,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
