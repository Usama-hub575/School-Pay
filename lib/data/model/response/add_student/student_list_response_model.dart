// To parse this JSON data, do
//
//     final studentListRespModel = studentListRespModelFromJson(jsonString);

import 'dart:convert';

StudentListResponseModel studentListResponseModelFromJson(String str) =>
    StudentListResponseModel.fromJson(json.decode(str));

String studentListRespModelToJson(StudentListResponseModel data) =>
    json.encode(data.toJson());

class StudentListResponseModel {
  StudentListResponseModel({
    required this.status,
    required this.getStudent,
  });

  bool status;
  GetStudent? getStudent;

  factory StudentListResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentListResponseModel(
        status: json["status"],
        getStudent: json["getStudent"] == null
            ? null
            : GetStudent.fromJson(json["getStudent"]),
      );

  static StudentListResponseModel empty() {
    return StudentListResponseModel(
      status: false,
      getStudent: null,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "getStudent": getStudent == null ? null : getStudent!.toJson(),
      };
}

class GetStudent {
  GetStudent({
    required this.count,
    required this.rows,
  });

  int count;
  List<StudentListRowData>? rows;

  factory GetStudent.fromJson(Map<String, dynamic> json) => GetStudent(
        count: json["count"] ?? 0,
        rows: json["rows"] == null
            ? []
            : List<StudentListRowData>.from(
                json["rows"].map((x) => StudentListRowData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "rows": rows == null
            ? null
            : List<dynamic>.from(rows!.map((x) => x.toJson())),
      };
}

class StudentListRowData {
  StudentListRowData({
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
    required this.file,
    required this.privacy,
    required this.createdAt,
    required this.updatedAt,
    required this.parentStudents,
  });

  DateTime? dob;
  DateTime? admissionDate;
  int id;
  String? studentRegNo;
  String? firstName;
  String? lastName;
  String? grade;
  String? parentEmiratesId;
  dynamic parentPhoneNumber;
  dynamic deletedAt;
  int schoolId;
  dynamic totalBalanceAmount;
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
  String? phoneNumber;
  dynamic otherNumber;
  dynamic profile;
  dynamic religion;
  dynamic nationality;
  dynamic gender;
  dynamic file;
  String privacy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? parentStudents;

  factory StudentListRowData.fromJson(Map<String, dynamic> json) =>
      StudentListRowData(
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
        file: json["file"],
        privacy: json["privacy"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        parentStudents: json["parentStudents"] == null
            ? null
            : List<dynamic>.from(json["parentStudents"].map((x) => x)),
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
        "file": file,
        "privacy": privacy,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "parentStudents": parentStudents == null
            ? null
            : List<dynamic>.from(parentStudents!.map((x) => x)),
      };
}
