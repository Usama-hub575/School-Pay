// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

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
    required this.countryCode,
    required this.emiratesId,
    required this.passport,
    required this.gender,
    required this.birth,
  });

  String email;
  String phone;
  String password;
  String firstName;
  String lastName;
  String countryCode;
  String emiratesId;
  String passport;
  String gender;
  String birth;


  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    countryCode: json["countryCode"],
    emiratesId: json["emiratesId"],
    passport: json["passport"],
    gender: json["gender"],
    birth: json["birth"]
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "countryCode": countryCode,
    "emiratesId": emiratesId,
    "passport" : passport,
    "gender" : gender,
    "birth" : birth
  };
}
