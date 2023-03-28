// To parse this JSON data, do
//
//     final cbdResponseModel = cbdResponseModelFromJson(jsonString);

import 'dart:convert';

CbdResponseModel cbdResponseModelFromJson(String str) => CbdResponseModel.fromJson(json.decode(str));

String cbdResponseModelToJson(CbdResponseModel data) => json.encode(data.toJson());

class CbdResponseModel {
  CbdResponseModel({
    required this.response,
  });

  Response response;

  factory CbdResponseModel.fromJson(Map<String, dynamic> json) => CbdResponseModel(
    response: Response.fromJson(json["Response"]),
  );

  Map<String, dynamic> toJson() => {
    "Response": response.toJson(),
  };
}

class Response {
  Response({
    required this.header,
    required this.body,
  });

  Header header;
  Body body;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    header: Header.fromJson(json["Header"]),
    body: Body.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "Header": header.toJson(),
    "Body": body.toJson(),
  };
}

class Body {
  Body({
    required this.paymentInformation,
  });

  PaymentInformation paymentInformation;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    paymentInformation: PaymentInformation.fromJson(json["PaymentInformation"]),
  );

  Map<String, dynamic> toJson() => {
    "PaymentInformation": paymentInformation.toJson(),
  };
}

class PaymentInformation {
  PaymentInformation({
    required this.cbdReferenceNo,
    required this.ccReferenceNo,
    required this.authCode,
    required this.orderId,
    required this.authorizationDateTime,
    required this.cardType,
    required this.maskedCardNumber,
    required this.tokenizedValue,
  });

  int cbdReferenceNo;
  int ccReferenceNo;
  int authCode;
  int orderId;
  String authorizationDateTime;
  String cardType;
  String maskedCardNumber;
  dynamic tokenizedValue;

  factory PaymentInformation.fromJson(Map<String, dynamic> json) => PaymentInformation(
    cbdReferenceNo: json["CBDReferenceNo"],
    ccReferenceNo: json["CCReferenceNo"].toDouble(),
    authCode: json["AuthCode"],
    orderId: json["OrderID"],
    authorizationDateTime: json["AuthorizationDateTime"],
    cardType: json["CardType"],
    maskedCardNumber: json["MaskedCardNumber"],
    tokenizedValue: json["TokenizedValue"],
  );

  Map<String, dynamic> toJson() => {
    "CBDReferenceNo": cbdReferenceNo,
    "CCReferenceNo": ccReferenceNo,
    "AuthCode": authCode,
    "OrderID": orderId,
    "AuthorizationDateTime": authorizationDateTime,
    "CardType": cardType,
    "MaskedCardNumber": maskedCardNumber,
    "TokenizedValue": tokenizedValue,
  };
}

class Header {
  Header({
    required this.responseCode,
    required this.responseMsg,
  });

  String responseCode;
  String responseMsg;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    responseCode: json["ResponseCode"],
    responseMsg: json["ResponseMsg"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode,
    "ResponseMsg": responseMsg,
  };
}
