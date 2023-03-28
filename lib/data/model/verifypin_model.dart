// To parse this JSON data, do
//
//     final verifyPinModel = verifyPinModelFromJson(jsonString);

import 'dart:convert';

VerifyPinModel verifyPinModelFromJson(String str) => VerifyPinModel.fromJson(json.decode(str));

String verifyPinModelToJson(VerifyPinModel data) => json.encode(data.toJson());

class VerifyPinModel {
  VerifyPinModel({
    required this.parentId,
    required this.pin,
  });

  String parentId;
  String pin;

  factory VerifyPinModel.fromJson(Map<String, dynamic> json) => VerifyPinModel(
    parentId: json["parentId"],
    pin: json["pin"],
  );

  Map<String, dynamic> toJson() => {
    "parentId": parentId,
    "pin": pin,
  };
}
