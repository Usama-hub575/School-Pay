class PostBankSourcePayload {
  Data? data;
  String? customerId;

  PostBankSourcePayload({this.data, this.customerId});

  static PostBankSourcePayload empty() {
    return PostBankSourcePayload(
      data: Data.empty(),
      customerId: '',
    );
  }

  PostBankSourcePayload.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    customerId = json['customerId'];
  }

  static Map<String, dynamic> toJson({required PostBankSourcePayload payload}) {
    final Map<String, dynamic> data = {};
    data['data'] = Data.toJson(d: payload.data!);
    data['customerId'] = payload.customerId;
    return data;
  }
}

class Data {
  String? status;
  String? secondaryStatus;
  String? message;
  String? lastApiResponse;
  String? exitPoint;
  PayloadBank? bank;
  String? method;

  Data(
      {this.status,
      this.secondaryStatus,
      this.message,
      this.lastApiResponse,
      this.exitPoint,
      this.bank,
      this.method});

  static Data empty() {
    return Data(
      status: '',
      secondaryStatus: '',
      message: '',
      lastApiResponse: '',
      exitPoint: '',
      bank: PayloadBank.empty(),
      method: '',
    );
  }

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    secondaryStatus = json['secondary_status'];
    message = json['message'];
    lastApiResponse = json['last_api_response'];
    exitPoint = json['exit_point'];
    bank = json['bank'] != null ? new PayloadBank.fromJson(json['bank']) : null;
    method = json['method'];
  }

  static Map<String, dynamic> toJson({required Data d}) {
    final Map<String, dynamic> data = {};
    data['status'] = d.status;
    data['secondary_status'] = d.secondaryStatus;
    data['message'] = d.message;
    data['last_api_response'] = d.lastApiResponse;
    data['exit_point'] = d.exitPoint;
    data['bank'] = PayloadBank.toJson(
      payloadBank: d.bank!,
    );
    data['method'] = d.method;
    return data;
  }
}

class PayloadBank {
  String? bankIdentifier;
  bool? isSupported;

  PayloadBank({this.bankIdentifier, this.isSupported});

  static PayloadBank empty() {
    return PayloadBank(
      bankIdentifier: '',
      isSupported: false,
    );
  }

  PayloadBank.fromJson(Map<String, dynamic> json) {
    bankIdentifier = json['bank_identifier'];
    isSupported = json['is_supported'];
  }

  static Map<String, dynamic> toJson({required PayloadBank payloadBank}) {
    final Map<String, dynamic> data = {};
    data['bank_identifier'] = payloadBank.bankIdentifier;
    data['is_supported'] = payloadBank.isSupported;
    return data;
  }
}
