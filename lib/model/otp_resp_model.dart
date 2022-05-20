// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromJson(jsonString);

import 'dart:convert';

OtpResponseModel otpResponseModelFromJson(String str) => OtpResponseModel.fromJson(json.decode(str));

String otpResponseModelToJson(OtpResponseModel data) => json.encode(data.toJson());

class OtpResponseModel {
  OtpResponseModel({
    required this.requestId,
    required this.type,
  });

  String? requestId;
  String? type;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) => OtpResponseModel(
    requestId: json["request_id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "request_id": requestId,
    "type": type,
  };
}
