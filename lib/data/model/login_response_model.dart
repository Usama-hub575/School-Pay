// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.status,
    required this.message,
    required this.token,
    required this.parent,
  });

  bool status;
  String? message;
  String? token;
  Parent? parent;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
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
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.dialCode,
    required this.email,
    required this.countryCode,
    required this.deletedAt,
    required this.emiratesId,
    required this.expiryDate,
    required this.area,
    required this.country,
    required this.address,
    required this.paymentConfigured,
    required this.pinConfigured,
    required this.pin,
    required this.profileImage,
    required this.token,
    required this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String phone;
  String dialCode;
  String email;
  String countryCode;
  dynamic deletedAt;
  String emiratesId;
  dynamic expiryDate;
  dynamic area;
  String country;
  String address;
  dynamic paymentConfigured;
  dynamic pinConfigured;
  String pin;
  dynamic profileImage;
  dynamic token;
  dynamic fcmToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"] ?? 0,
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        phone: json["phone"] ?? '',
        dialCode: json["dialCode"] ?? '',
        email: json["email"] ?? '',
        countryCode: json["countryCode"] ?? '',
        deletedAt: json["deletedAt"] ?? DateTime.now(),
        emiratesId: json["emiratesId"] ?? '',
        expiryDate: json["expiryDate"] ?? '',
        area: json["area"] ?? '',
        country: json["country"] ?? '',
        address: json["address"] ?? '',
        paymentConfigured: json["paymentConfigured"] ?? '',
        pinConfigured: json["pinConfigured"] ?? '',
        pin: json["pin"] ?? '',
        profileImage: json["profileImage"] ?? '',
        token: json["token"] ?? '',
        fcmToken: json["fcmToken"] ?? '',
        createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
        updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "dialCode": dialCode,
        "email": email,
        "countryCode": countryCode,
        "deletedAt": deletedAt,
        "emiratesId": emiratesId,
        "expiryDate": expiryDate,
        "area": area,
        "country": country,
        "address": address,
        "paymentConfigured": paymentConfigured,
        "pinConfigured": pinConfigured,
        "pin": pin,
        "profileImage": profileImage,
        "token": token,
        "fcmToken": fcmToken,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
