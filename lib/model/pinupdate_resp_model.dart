// To parse this JSON data, do
//
//     final pinUpdateResModel = pinUpdateResModelFromJson(jsonString);

import 'dart:convert';

PinUpdateResModel pinUpdateResModelFromJson(String str) => PinUpdateResModel.fromJson(json.decode(str));

String pinUpdateResModelToJson(PinUpdateResModel data) => json.encode(data.toJson());

class PinUpdateResModel {
  PinUpdateResModel({
    required this.status,
    required this.message,
    required this.parent,
  });

  bool status;
  String? message;
  List<int>? parent;

  factory PinUpdateResModel.fromJson(Map<String, dynamic> json) => PinUpdateResModel(
    status: json["status"],
    message: json["message"],
    parent: List<int>.from(json["parent"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "parent": List<dynamic>.from(parent!.map((x) => x)),
  };
}
