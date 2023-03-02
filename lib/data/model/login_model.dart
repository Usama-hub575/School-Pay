// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.email,
    required this.password,
    required this.fcmToken,
  });

  String email;
  String password;
  dynamic fcmToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    email: json["email"],
    password: json["password"],
    fcmToken: json["fcmToken"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "fcmToken": fcmToken,
  };
}
