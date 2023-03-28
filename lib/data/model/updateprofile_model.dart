// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.expiryDate,
    required this.emiratesId,
  });

  dynamic id;
  String firstName;
  String lastName;
  String email;
  String expiryDate;
  String emiratesId;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json['email'],
    expiryDate: json['expiryDate'],
    emiratesId: json['emiratesId']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email" : email,
    "expiryDate" : expiryDate,
    "emiratesId" : emiratesId
  };
}
