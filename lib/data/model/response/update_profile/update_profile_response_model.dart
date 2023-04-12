// To parse this JSON data, do
//
//     final updateProfileRespModel = updateProfileRespModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponseModel updateProfileResponseModelFromJson(String str) =>
    UpdateProfileResponseModel.fromJson(json.decode(str));

String updateProfileResponseModelToJson(UpdateProfileResponseModel data) =>
    json.encode(data.toJson());

class UpdateProfileResponseModel {
  UpdateProfileResponseModel({
    required this.status,
    required this.message,
    required this.parent,
  });

  bool status;
  String? message;
  List<int>? parent;

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponseModel(
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
