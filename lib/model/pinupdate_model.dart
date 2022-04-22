// To parse this JSON data, do
//
//     final pinUpdateModel = pinUpdateModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PinUpdateModel pinUpdateModelFromJson(String str) => PinUpdateModel.fromJson(json.decode(str));

String pinUpdateModelToJson(PinUpdateModel data) => json.encode(data.toJson());

class PinUpdateModel {
  PinUpdateModel({
    required this.id,
    required this.pin,
  });

  String id;
  String pin;

  factory PinUpdateModel.fromJson(Map<String, dynamic> json) => PinUpdateModel(
    id: json["id"],
    pin: json["pin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pin": pin,
  };
}
