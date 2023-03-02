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

  static Parent empty() {
    return Parent(
      id: 0,
      email: '',
      phone: '',
      firstName: '',
      lastName: '',
      dialCode: '',
      countryCode: '',
      emiratesId: '',
      passport: '',
      area: '',
      country: '',
      address: '',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      deletedAt: '',
      expiryDate: '',
      paymentConfigured: '',
      pinConfigured: '',
      pin: '',
      profileImage: '',
      token: '',
      fcmToken: '',
    );
  }

  int? id;
  String? email;
  String? phone;
  String? firstName;
  String? lastName;
  String? dialCode;
  String? countryCode;
  String? emiratesId;
  String? passport;
  String? area;
  String? country;
  String? address;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? deletedAt;
  String? expiryDate;
  String? paymentConfigured;
  String? pinConfigured;
  String? pin;
  String? profileImage;
  String? token;
  String? fcmToken;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    id: json["id"] ?? -1,
    email: json["email"] ?? "",
    phone: json["phone"] ?? "",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    dialCode: json["dialCode"] ?? "",
    countryCode: json["countryCode"] ?? "",
    emiratesId: json["emiratesId"] ?? "",
    passport: json["passport"] ?? "",
    area: json["area"] ?? "",
    country: json["country"] ?? "",
    address: json["address"] ?? "",
    updatedAt: json["updatedAt"] != null
        ? DateTime.parse(json["updatedAt"])
        : DateTime.now(),
    createdAt: json["createdAt"] != null
        ? DateTime.parse(json["createdAt"])
        : DateTime.now(),
    deletedAt: json["deletedAt"] ?? "",
    expiryDate: json["expiryDate"] ?? "",
    paymentConfigured:
    json["paymentConfigured"] ?? "",
    pinConfigured:
    json["pinConfigured"] ?? "",
    pin: json["pin"] ?? "",
    profileImage: json["profileImage"] ?? "",
    token: json["token"] ?? "",
    fcmToken: json["fcmToken"] ?? "",
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
    "updatedAt": updatedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
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