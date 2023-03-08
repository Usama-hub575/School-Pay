import 'package:paynest_flutter_app/export.dart';

AuthenticationModel registerResponseModelFromJson(String str) =>
    AuthenticationModel.fromJson(json.decode(str));

String registerResponseModelToJson(AuthenticationModel data) =>
    json.encode(data.toJson());

class AuthenticationModel {
  AuthenticationModel({
    required this.status,
    required this.message,
    required this.token,
    required this.parent,
  });

  bool status;
  String message;
  String token;
  Parent parent;

  static AuthenticationModel empty() {
    return AuthenticationModel(
      status: false,
      message: '',
      token: '',
      parent: Parent.empty(),
    );
  }

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
          status: json["status"] ?? '',
          message: json["message"],
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
