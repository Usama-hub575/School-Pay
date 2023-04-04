// To parse this JSON data, do
//
//     final myStudentsRespModel = myStudentsRespModelFromJson(jsonString);

import 'package:paynest_flutter_app/export.dart';

MyStudentsResponseModel myStudentsResponseModelFromJson(String str) =>
    MyStudentsResponseModel.fromJson(json.decode(str));

String myStudentsResponseModelToJson(MyStudentsResponseModel data) =>
    json.encode(data.toJson());

class MyStudentsResponseModel {
  MyStudentsResponseModel({
    required this.status,
    required this.students,
  });

  bool status;
  List<StudentData>? students;

  static MyStudentsResponseModel empty() {
    return MyStudentsResponseModel(
      status: false,
      students: [],
    );
  }

  factory MyStudentsResponseModel.fromJson(Map<String, dynamic> json) =>
      MyStudentsResponseModel(
        status: json["status"],
        students: List<StudentData>.from(
            json["students"].map((x) => StudentData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "students": List<dynamic>.from(students!.map((x) => x.toJson())),
      };
}

class StudentData {
  StudentData({
    required this.id,
    required this.parentId,
    required this.studentId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
    required this.isSelected,
  });

  static StudentData empty() {
    return StudentData(
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

  factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
        id: json["id"] ?? -1,
        parentId: json["parentId"] ?? -1,
        studentId: json["studentId"] ?? -1,
        deletedAt: json["deletedAt"] ?? -1,
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
        id: json["id"] ?? -1,
        studentRegNo: json["studentRegNo"] ?? "-",
        firstName: json["firstName"] ?? "-",
        lastName: json["lastName"] ?? "-",
        grade: json["grade"] ?? "-",
        parentEmiratesId: json["parentEmiratesId"] ?? "-",
        parentPhoneNumber: json["parentPhoneNumber"] ?? "-",
        deletedAt: json["deletedAt"] ?? "",
        schoolId: json["schoolId"] ?? -1,
        totalBalanceAmount: json["total_balance_amount"] ?? "-",
        guardianFirstName: json["guardianFirstName"] ?? "-",
        guardianLastName: json["guardianLastName"] ?? "-",
        guardianGender: json["guardianGender"] ?? "-",
        guardianEmiratesId: json["guardianEmiratesId"] ?? "-",
        guardianNationality: json["guardianNationality"] ?? "-",
        guardianReligion: json["guardianReligion"] ?? "-",
        area: json["area"] ?? "-",
        region: json["region"] ?? "-",
        streetAddress: json["streetAddress"] ?? "-",
        email: json["email"] ?? "-",
        phoneNumber: json["phoneNumber"] ?? "-",
        otherNumber: json["otherNumber"] ?? "-",
        profile: json["profile"] ?? "-",
        religion: json["religion"] ?? "-",
        nationality: json["nationality"] ?? "-",
        gender: json["gender"] ?? "-",
        dueDate: json["dueDate"] == null
            ? DateTime.now()
            : DateTime.parse(json["dueDate"]),
        file: json["file"] ?? "-",
        privacy: json["privacy"] ?? "-",
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        'payeeType': payeeType,
        "school": school!.toJson(),
      };
}

// class School {
//   School({
//     required this.id,
//     required this.name,
//     required this.deletedAt,
//     required this.addedBy,
//     required this.address,
//     required this.description,
//     required this.vat,
//     required this.paynestFee,
//     required this.apiKey,
//     required this.merchantId,
//     required this.file,
//     required this.privacy,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String name;
//   dynamic deletedAt;
//   dynamic addedBy;
//   String address;
//   String description;
//   double vat;
//   int paynestFee;
//   String? apiKey;
//   String? merchantId;
//   String? file;
//   String? privacy;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   static School empty() {
//     return School(
//         id: -1,
//         name: "-",
//         deletedAt: "-",
//         addedBy: "-",
//         address: "-",
//         description: "-",
//         vat: -1.0,
//         paynestFee: -1,
//         apiKey: "-",
//         merchantId: "-",
//         file: "-",
//         privacy: "-",
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now());
//   }
//
//   factory School.fromJson(Map<String, dynamic> json) => School(
//         id: json["id"] ?? 0,
//         name: json["name"] ?? "-",
//         deletedAt: json["deletedAt"] ?? "-",
//         addedBy: json["addedBy"] ?? "-",
//         address: json["address"] ?? "-",
//         description: json["description"] ?? "-",
//         vat: double.parse(json["vat"]),
//         paynestFee: json["paynestFee"] ?? 0,
//         apiKey: json["APIKey"] ?? "",
//         merchantId: json["merchantId"] ?? "-",
//         file: json["file"] ?? "-",
//         privacy: json["privacy"] ?? "-",
//         createdAt: json["createdAt"] != null
//             ? DateTime.parse(json["createdAt"])
//             : DateTime.now(),
//         updatedAt: json["updatedAt"] != null
//             ? DateTime.parse(json["updatedAt"])
//             : DateTime.now(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "deletedAt": deletedAt,
//         "addedBy": addedBy,
//         "address": address,
//         "description": description,
//         "vat": vat,
//         "paynestFee": paynestFee,
//         "APIKey": apiKey,
//         "merchantId": merchantId,
//         "file": file,
//         "privacy": privacy,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//       };
// }
