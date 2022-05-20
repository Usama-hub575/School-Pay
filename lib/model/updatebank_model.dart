// To parse this JSON data, do
//
//     final updateBankModel = updateBankModelFromJson(jsonString);

import 'dart:convert';

UpdateBankModel updateBankModelFromJson(String str) => UpdateBankModel.fromJson(json.decode(str));

String updateBankModelToJson(UpdateBankModel data) => json.encode(data.toJson());

class UpdateBankModel {
  UpdateBankModel({
    required this.Id,
    required this.bankResponse,
  });

  String Id;
  String bankResponse;

  factory UpdateBankModel.fromJson(Map<String, dynamic> json) => UpdateBankModel(
    Id: json["id"],
    bankResponse: json["bankResponse"],
  );

  Map<String, dynamic> toJson() => {
    "id": Id,
    "bankResponse": bankResponse,
  };
}
