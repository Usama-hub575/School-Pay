// To parse this JSON data, do
//
//     final schoolListRespModel = schoolListRespModelFromJson(jsonString);

import 'dart:convert';

SchoolListRespModel schoolListRespModelFromJson(String str) =>
    SchoolListRespModel.fromJson(json.decode(str));

String schoolListRespModelToJson(SchoolListRespModel data) =>
    json.encode(data.toJson());

class SchoolListRespModel {
  SchoolListRespModel({
    required this.status,
    required this.log,
  });

  bool status;
  List<Log>? log;

  factory SchoolListRespModel.fromJson(Map<String, dynamic> json) =>
      SchoolListRespModel(
        status: json["status"],
        log: List<Log>.from(json["log"].map((x) => Log.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "log": List<dynamic>.from(log!.map((x) => x.toJson())),
      };
}

class Log {
  Log({
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
    required this.payeeType,
    required this.isSelected,
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
  String? file;
  String privacy;
  DateTime createdAt;
  DateTime updatedAt;
  String? payeeType;
  bool isSelected;

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        id: json["id"] ?? -1,
        name: json["name"] ?? "",
        deletedAt: json["deletedAt"] ?? "",
        addedBy: json["addedBy"] ?? "",
        address: json["address"] ?? "",
        description: json["description"] ?? "",
        vat: json["vat"] != null ? double.parse(json["vat"]) : -0.0,
        paynestFee: json["paynestFee"] ?? 0,
        apiKey: json["APIKey"] ?? "",
        merchantId: json["merchantId"] ?? "",
        file: json["file"] ?? "",
        privacy: json["privacy"] ?? "",
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        payeeType: json['payeeType'] ?? '',
        isSelected: false,
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        'payeeType': payeeType,
        "isSelected": false,
      };
}
