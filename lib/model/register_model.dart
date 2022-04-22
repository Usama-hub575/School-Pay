// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.email,
    required this.phone,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.dialCode,
    required this.countryCode,
    required this.emiratesId,
    required this.area,
    required this.country,
    required this.address,
  });

  String email;
  String phone;
  String password;
  String firstName;
  String lastName;
  String dialCode;
  String countryCode;
  String emiratesId;
  String area;
  String country;
  String address;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    dialCode: json["dialCode"],
    countryCode: json["countryCode"],
    emiratesId: json["emiratesId"],
    area: json["area"],
    country: json["country"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "dialCode": dialCode,
    "countryCode": countryCode,
    "emiratesId": emiratesId,
    "area": area,
    "country": country,
    "address": address,
  };
}
