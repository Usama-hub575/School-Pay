// To parse this JSON data, do
//
//     final transactionListRespModel = transactionListRespModelFromJson(jsonString);

import 'dart:convert';

TransactionListRespModel transactionListRespModelFromJson(String str) =>
    TransactionListRespModel.fromJson(json.decode(str));

String transactionListRespModelToJson(TransactionListRespModel data) =>
    json.encode(data.toJson());

class TransactionListRespModel {
  TransactionListRespModel({
    required this.status,
    required this.transactions,
  });

  bool status;
  Transactions? transactions;

  factory TransactionListRespModel.fromJson(Map<String, dynamic> json) =>
      TransactionListRespModel(
        status: json["status"] ?? 0,
        transactions: json["transactions"] == null
            ? Transactions.empty()
            : Transactions.fromJson(json["transactions"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "transactions": transactions == null ? null : transactions!.toJson(),
      };
}

class Transactions {
  Transactions({
    required this.count,
    required this.rows,
  });

  static Transactions empty() {
    return Transactions(count: 0, rows: []);
  }

  int count;
  List<TransactionsRow>? rows;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        count: json["count"] ?? -1,
        rows: json["rows"] == null
            ? []
            : List<TransactionsRow>.from(
                json["rows"].map((x) => TransactionsRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "rows": rows == null
            ? null
            : List<dynamic>.from(rows!.map((x) => x.toJson())),
      };
}

class TransactionsRow {
  TransactionsRow({
    required this.id,
    required this.schoolId,
    required this.parentId,
    required this.invoiceId,
    required this.studentId,
    required this.payedOn,
    required this.amount,
    required this.deletedAt,
    required this.refNo,
    required this.type,
    required this.vat,
    required this.paynestFee,
    required this.country,
    required this.bankResponse,
    required this.amountToPay,
    required this.stringToBank,
    required this.stringFromBank,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
    required this.school,
  });

  int id;
  int schoolId;
  int parentId;
  int invoiceId;
  int studentId;
  DateTime payedOn;
  int amount;
  dynamic deletedAt;
  String? refNo;
  String? type;
  dynamic vat;
  dynamic paynestFee;
  dynamic country;
  dynamic bankResponse;
  int amountToPay;
  dynamic stringToBank;
  dynamic stringFromBank;
  DateTime? createdAt;
  DateTime? updatedAt;
  Student? student;
  School? school;

  factory TransactionsRow.fromJson(Map<String, dynamic> json) =>
      TransactionsRow(
        id: json["id"] ?? -1,
        schoolId: json["schoolId"] ?? -1,
        parentId: json["parentId"] ?? -1,
        invoiceId: json["invoiceId"] ?? -1,
        studentId: json["studentId"] ?? -1,
        payedOn: json["payedOn"] == null
            ? DateTime.now()
            : DateTime.parse(json["payedOn"]),
        amount: json["amount"] ?? -1,
        deletedAt: json["deletedAt"] ?? "-",
        refNo: json["refNo"] ?? "-",
        type: json["type"] ?? "-",
        vat: json["vat"] ?? "-",
        paynestFee: json["paynestFee"] ?? "-",
        country: json["country"] ?? "-",
        bankResponse: json["bankResponse"] ?? "-",
        amountToPay: json["amountToPay"] ?? -1,
        stringToBank: json["stringToBank"] ?? "-",
        stringFromBank: json["stringFromBank"] ?? "-",
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["updatedAt"]),
        student: json["student"] == null
            ? Student.empty()
            : Student.fromJson(json["student"]),
        school: json["school"] == null
            ? School.empty()
            : School.fromJson(json["school"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "schoolId": schoolId,
        "parentId": parentId,
        "invoiceId": invoiceId,
        "studentId": studentId,
        "payedOn": payedOn.toIso8601String(),
        "amount": amount,
        "deletedAt": deletedAt,
        "refNo": refNo,
        "type": type,
        "vat": vat,
        "paynestFee": paynestFee,
        "country": country,
        "bankResponse": bankResponse,
        "amountToPay": amountToPay,
        "stringToBank": stringToBank,
        "stringFromBank": stringFromBank,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "student": student == null ? null : student!.toJson(),
        "school": school == null ? null : school!.toJson(),
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
  dynamic apiKey;
  String merchantId;
  String file;
  String privacy;
  DateTime? createdAt;
  DateTime? updatedAt;

  static School empty() {
    return School(
        id: -1,
        name: "-",
        deletedAt: DateTime.now(),
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
        id: json["id"] ?? -1,
        name: json["name"] ?? "-",
        deletedAt:
            json["deletedAt"] != null ? DateTime.now() : json["deletedAt"],
        addedBy: json["addedBy"] ?? "",
        address: json["address"] ?? "-",
        description: json["description"] ?? "-",
        vat: json["vat"] == null ? -1.0 : double.parse(json["vat"]),
        paynestFee: json["paynestFee"] ?? -1,
        apiKey: json["APIKey"] != null ? "-" : json["APIKey"],
        merchantId: json["merchantId"] ?? "-",
        file: json["file"] ?? "-",
        privacy: json["privacy"] ?? "-",
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["updatedAt"]),
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
        "APIKey": apiKey,
        "merchantId": merchantId,
        "file": file,
        "privacy": privacy,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Student {
  Student({
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
  String parentPhoneNumber;
  dynamic deletedAt;
  int schoolId;
  double totalBalanceAmount;
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
  DateTime? dueDate;
  String? file;
  String privacy;
  DateTime? createdAt;
  DateTime? updatedAt;

  static Student empty() {
    return Student(
        dob: DateTime.now(),
        admissionDate: DateTime.now(),
        id: -1,
        studentRegNo: "-",
        firstName: "-",
        lastName: "-",
        grade: "-",
        parentEmiratesId: "-",
        parentPhoneNumber: "-",
        deletedAt: "-",
        schoolId: -1,
        totalBalanceAmount: 0.0,
        guardianFirstName: "-",
        guardianLastName: "-",
        guardianGender: "-",
        guardianEmiratesId: "-",
        guardianNationality: "-",
        guardianReligion: "-",
        area: "-",
        region: "-",
        streetAddress: "-",
        email: "-",
        phoneNumber: "-",
        otherNumber: "-",
        profile: "-",
        religion: "-",
        nationality: "-",
        gender: "-",
        dueDate: DateTime.now(),
        file: "-",
        privacy: "-",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
  }

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        dob: json["dob"] == null ? DateTime.now() : DateTime.parse(json["dob"]),
        admissionDate: json["admissionDate"] == null
            ? DateTime.now()
            : DateTime.parse(json["admissionDate"]),
        id: json["id"] ?? -1,
        studentRegNo: json["studentRegNo"] ?? "-",
        firstName: json["firstName"] ?? "-",
        lastName: json["lastName"] ?? "-",
        grade: json["grade"] ?? "-",
        parentEmiratesId: json["parentEmiratesId"] ?? "-",
        parentPhoneNumber: json["parentPhoneNumber"] ?? "-",
        deletedAt: json["deletedAt"] ?? "-",
        schoolId: json["schoolId"] ?? -1,
        totalBalanceAmount: json["total_balance_amount"] == null
            ? 0.0
            : double.parse(json["total_balance_amount"].toString()),
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
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
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
