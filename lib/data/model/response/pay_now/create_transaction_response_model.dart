// To parse this JSON data, do
//
//     final createTransactionResModel = createTransactionResModelFromJson(jsonString);

import 'dart:convert';

CreateTransactionResponseModel createTransactionResponseModelFromJson(
        String str) =>
    CreateTransactionResponseModel.fromJson(json.decode(str));

String createTransactionResponseModelToJson(
        CreateTransactionResponseModel data) =>
    json.encode(data.toJson());

class CreateTransactionResponseModel {
  CreateTransactionResponseModel({
    required this.status,
    required this.transaction,
  });

  bool status;
  String? transaction;

  factory CreateTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateTransactionResponseModel(
        status: json["status"],
        transaction: json['message'],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "transaction": transaction,
      };
}

class Transaction {
  Transaction({
    required this.bankResponse,
    required this.amountToPay,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
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
    required this.stringToBank,
    required this.stringFromBank,
  });

  dynamic bankResponse;
  int amountToPay;
  int id;
  DateTime updatedAt;
  DateTime createdAt;
  dynamic schoolId;
  dynamic parentId;
  dynamic invoiceId;
  dynamic studentId;
  dynamic payedOn;
  int amount;
  dynamic deletedAt;
  dynamic refNo;
  dynamic type;
  dynamic vat;
  dynamic paynestFee;
  dynamic country;
  dynamic stringToBank;
  dynamic stringFromBank;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        bankResponse: json["bankResponse"],
        amountToPay: json["amountToPay"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        schoolId: json["schoolId"],
        parentId: json["parentId"],
        invoiceId: json["invoiceId"],
        studentId: json["studentId"],
        payedOn: json["payedOn"],
        amount: json["amount"],
        deletedAt: json["deletedAt"],
        refNo: json["refNo"],
        type: json["type"],
        vat: json["vat"],
        paynestFee: json["paynestFee"],
        country: json["country"],
        stringToBank: json["stringToBank"],
        stringFromBank: json["stringFromBank"],
      );

  Map<String, dynamic> toJson() => {
        "bankResponse": bankResponse,
        "amountToPay": amountToPay,
        "id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "schoolId": schoolId,
        "parentId": parentId,
        "invoiceId": invoiceId,
        "studentId": studentId,
        "payedOn": payedOn,
        "amount": amount,
        "deletedAt": deletedAt,
        "refNo": refNo,
        "type": type,
        "vat": vat,
        "paynestFee": paynestFee,
        "country": country,
        "stringToBank": stringToBank,
        "stringFromBank": stringFromBank,
      };
}
