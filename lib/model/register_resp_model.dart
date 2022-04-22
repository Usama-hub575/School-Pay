// To parse this JSON data, do
//
//     final registerRespModel = registerRespModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterRespModel registerRespModelFromJson(String str) => RegisterRespModel.fromJson(json.decode(str));

String registerRespModelToJson(RegisterRespModel data) => json.encode(data.toJson());

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

  factory RegisterRespModel.fromJson(Map<String, dynamic> json) => RegisterRespModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    parent: Parent.fromJson(json["parent"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "parent": parent!.toJson(),
  };
}

class Parent {
  Parent({
    required this.id,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.dialCode,
    required this.countryCode,
    required this.emiratesId,
    required this.area,
    required this.country,
    required this.address,
    required this.updatedAt,
    required this.createdAt,
    required this.deletedAt,
    required this.expiryDate,
    required this.paymentConfigured,
    required this.pinConfigured,
    required this.pin,
    required this.profileImage,
    required this.token,
    required this.fcmToken,
  });

  int id;
  String email;
  String phone;
  String firstName;
  String lastName;
  String dialCode;
  String countryCode;
  String emiratesId;
  String? area;
  String country;
  String address;
  DateTime updatedAt;
  DateTime createdAt;
  dynamic deletedAt;
  dynamic expiryDate;
  dynamic paymentConfigured;
  dynamic pinConfigured;
  dynamic pin;
  dynamic profileImage;
  dynamic token;
  dynamic fcmToken;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    dialCode: json["dialCode"],
    countryCode: json["countryCode"],
    emiratesId: json["emiratesId"],
    area: json["area"],
    country: json["country"],
    address: json["address"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    deletedAt: json["deletedAt"],
    expiryDate: json["expiryDate"],
    paymentConfigured: json["paymentConfigured"],
    pinConfigured: json["pinConfigured"],
    pin: json["pin"],
    profileImage: json["profileImage"],
    token: json["token"],
    fcmToken: json["fcmToken"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "firstName": firstName,
    "lastName": lastName,
    "dialCode": dialCode,
    "countryCode": countryCode,
    "emiratesId": emiratesId,
    "area": area,
    "country": country,
    "address": address,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "deletedAt": deletedAt,
    "expiryDate": expiryDate,
    "paymentConfigured": paymentConfigured,
    "pinConfigured": pinConfigured,
    "pin": pin,
    "profileImage": profileImage,
    "token": token,
    "fcmToken": fcmToken,
  };
}
