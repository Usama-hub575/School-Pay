// To parse this JSON data, do
//
//     final registerRespModel = registerRespModelFromJson(jsonString);

import 'package:paynest_flutter_app/export.dart';

RegisterRespModel registerRespModelFromJson(String str) =>
    RegisterRespModel.fromJson(json.decode(str));

String registerRespModelToJson(RegisterRespModel data) =>
    json.encode(data.toJson());

class RegisterRespModel {
  RegisterRespModel({
    required this.status,
    required this.message,
    required this.token,
    required this.parent,
  });

  bool status;
  String? message;
  String? token;
  Parent? parent;

  factory RegisterRespModel.fromJson(Map<String, dynamic> json) =>
      RegisterRespModel(
          status: json["status"] ?? '',
          message: json["message"] ?? '',
          token: json["token"] ?? '',
          parent: json['parent'] != null
              ? Parent.fromJson(json["parent"])
              : Parent.empty());

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "parent": parent!.toJson(),
      };
}
