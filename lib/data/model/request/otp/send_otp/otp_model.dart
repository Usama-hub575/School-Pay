import 'package:paynest_flutter_app/export.dart';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    required this.email,
    required this.phone,
    required this.dialCode,
  });
  String email;
  String phone;
  String dialCode;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        email: json["email"],
        phone: json["phone"],
        dialCode: '',
      );

  Map<String, dynamic> toJson() =>
      {"email": email, "phone": phone, 'dialCode': dialCode};
}
