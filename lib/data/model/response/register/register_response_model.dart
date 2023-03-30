// To parse this JSON data, do
//
//     final registerRespModel = registerRespModelFromJson(jsonString);

import 'package:paynest_flutter_app/export.dart';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) =>
    json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({
    required this.status,
    required this.message,
    required this.token,
    required this.parent,
  });

  bool status;
  String? message;
  String? token;
  Parent? parent;

  static RegisterResponseModel empty() {
    return RegisterResponseModel(
      status: false,
      message: '',
      token: '',
      parent: Parent.empty(),
    );
  }

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
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
