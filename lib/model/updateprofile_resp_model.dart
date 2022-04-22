// To parse this JSON data, do
//
//     final updateProfileRespModel = updateProfileRespModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateProfileRespModel updateProfileRespModelFromJson(String str) => UpdateProfileRespModel.fromJson(json.decode(str));

String updateProfileRespModelToJson(UpdateProfileRespModel data) => json.encode(data.toJson());

class UpdateProfileRespModel {
  UpdateProfileRespModel({
    required this.status,
    required this.message,
    required this.parent,
  });

  bool status;
  String? message;
  List<int>? parent;

  factory UpdateProfileRespModel.fromJson(Map<String, dynamic> json) => UpdateProfileRespModel(
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
