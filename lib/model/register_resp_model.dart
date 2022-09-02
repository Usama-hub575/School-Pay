// To parse this JSON data, do
//
//     final registerRespModel = registerRespModelFromJson(jsonString);

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
    status: json["status"] ?? '',
    message: json["message"] ?? '',
    token: json["token"] ?? '',
    parent: json['parent'] != null ? Parent.fromJson(json["parent"]) : Parent.empty()
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
    required this.passport,
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

  static Parent empty(){
    return Parent(id: 0, email: '', phone: '', firstName: '', lastName: '', dialCode: '', countryCode: '', emiratesId: '', passport: '', area: '', country: '', address: '', updatedAt: DateTime.now(), createdAt: DateTime.now(), deletedAt: '', expiryDate: '', paymentConfigured:'', pinConfigured: '', pin: '', profileImage: '', token: '', fcmToken: '');
  }

  int id;
  String email;
  String phone;
  String firstName;
  String lastName;
  String dialCode;
  String countryCode;
  String emiratesId;
  String passport;
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
    id: json["id"] !=null? json["id"] : -1,
    email: json["email"] !=null ? json["email"]: "",
    phone: json["phone"] !=null ? json["phone"] : "",
    firstName: json["firstName"] !=null? json["firstName"] : "",
    lastName: json["lastName"] !=null ? json["lastName"] : "",
    dialCode: json["dialCode"] !=null ? json["dialCode"] : "",
    countryCode: json["countryCode"] !=null ? json["countryCode"] : "",
    emiratesId: json["emiratesId"] !=null ? json["emiratesId"] : "",
    passport: json["passport"] !=null ? json["passport"] : "",
    area: json["area"] !=null ?json["area"] : "",
    country: json["country"] !=null ?json["country"] : "",
    address: json["address"] !=null ? json["address"] : "",
    updatedAt: json["updatedAt"] !=null ? DateTime.parse(json["updatedAt"]) : DateTime.now(),
    createdAt: json["createdAt"] !=null? DateTime.parse(json["createdAt"]) :DateTime.now(),
    deletedAt: json["deletedAt"] !=null? json["deletedAt"] : "",
    expiryDate: json["expiryDate"] !=null ?json["expiryDate"] : "",
    paymentConfigured: json["paymentConfigured"] !=null ? json["paymentConfigured"] : "",
    pinConfigured: json["pinConfigured"] !=null? json["pinConfigured"]: "",
    pin: json["pin"] !=null? json["pin"] : "",
    profileImage: json["profileImage"] !=null ? json["profileImage"] : "",
    token: json["token"] !=null ? json["token"] :"",
    fcmToken: json["fcmToken"] !=null ? json["fcmToken"] : "",
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
    "passport": passport,
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
