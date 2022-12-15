class LeanPaymentModel {
  bool? status;
  String? statusMsg;
  Response? response;

  LeanPaymentModel({this.status, this.statusMsg, this.response});

  LeanPaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusMsg'] = this.statusMsg;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
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
        leanCustomerBankAccounts!.add(new LeanCustomerBankAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leanCustomerId'] = this.leanCustomerId;
    data['leanAppToken'] = this.leanAppToken;
    data['leanPermissionsRequired'] = this.leanPermissionsRequired;
    if (this.leanCustomerBankAccounts != null) {
      data['leanCustomerBankAccounts'] =
          this.leanCustomerBankAccounts!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banksLeanId'] = this.banksLeanId;
    data['type'] = this.type;
    data['userId'] = this.userId;
    data['sourceDestinationId'] = this.sourceDestinationId;
    data['bankSwiftCode'] = this.bankSwiftCode;
    data['bankAddress'] = this.bankAddress;
    data['accountIban'] = this.accountIban;
    data['accountNumber'] = this.accountNumber;
    data['accountTitle'] = this.accountTitle;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
