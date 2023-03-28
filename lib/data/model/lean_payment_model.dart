class LeanPaymentModel {
  bool? status;
  String? statusMsg;
  Response? response;

  LeanPaymentModel({this.status, this.statusMsg, this.response});

  LeanPaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusMsg'] = statusMsg;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  String? leanCustomerId;
  String? leanAppToken;
  List<String>? leanPermissionsRequired;
  List<LeanCustomerBankAccounts>? leanCustomerBankAccounts;

  Response(
      {this.leanCustomerId,
      this.leanAppToken,
      this.leanPermissionsRequired,
      this.leanCustomerBankAccounts});

  Response.fromJson(Map<String, dynamic> json) {
    leanCustomerId = json['leanCustomerId'];
    leanAppToken = json['leanAppToken'];
    leanPermissionsRequired = json['leanPermissionsRequired'].cast<String>();
    if (json['leanCustomerBankAccounts'] != null) {
      leanCustomerBankAccounts = <LeanCustomerBankAccounts>[];
      json['leanCustomerBankAccounts'].forEach((v) {
        leanCustomerBankAccounts!.add(LeanCustomerBankAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['leanCustomerId'] = leanCustomerId;
    data['leanAppToken'] = leanAppToken;
    data['leanPermissionsRequired'] = leanPermissionsRequired;
    if (leanCustomerBankAccounts != null) {
      data['leanCustomerBankAccounts'] =
          leanCustomerBankAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeanCustomerBankAccounts {
  int? id;
  int? banksLeanId;
  String? type;
  int? userId;
  String? sourceDestinationId;
  String? bankSwiftCode;
  String? bankAddress;
  String? accountIban;
  String? accountNumber;
  String? accountTitle;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LeanCustomerBankAccounts(
      {this.id,
      this.banksLeanId,
      this.type,
      this.userId,
      this.sourceDestinationId,
      this.bankSwiftCode,
      this.bankAddress,
      this.accountIban,
      this.accountNumber,
      this.accountTitle,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  LeanCustomerBankAccounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banksLeanId = json['banksLeanId'];
    type = json['type'];
    userId = json['userId'];
    sourceDestinationId = json['sourceDestinationId'];
    bankSwiftCode = json['bankSwiftCode'];
    bankAddress = json['bankAddress'];
    accountIban = json['accountIban'];
    accountNumber = json['accountNumber'];
    accountTitle = json['accountTitle'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banksLeanId'] = banksLeanId;
    data['type'] = type;
    data['userId'] = userId;
    data['sourceDestinationId'] = sourceDestinationId;
    data['bankSwiftCode'] = bankSwiftCode;
    data['bankAddress'] = bankAddress;
    data['accountIban'] = accountIban;
    data['accountNumber'] = accountNumber;
    data['accountTitle'] = accountTitle;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
