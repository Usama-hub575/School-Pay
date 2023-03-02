// To parse this JSON data, do
//
//     final partialPayModel = partialPayModelFromJson(jsonString);

import 'dart:convert';

PartialPayModel partialPayModelFromJson(String str) => PartialPayModel.fromJson(json.decode(str));

String partialPayModelToJson(PartialPayModel data) => json.encode(data.toJson());

class PartialPayModel {
  PartialPayModel({
    required this.id,
    required this.fee,
  });

  String id;
  String fee;

  factory PartialPayModel.fromJson(Map<String, dynamic> json) => PartialPayModel(
    id: json["id"],
    fee: json["fee"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fee": fee,
  };
}
