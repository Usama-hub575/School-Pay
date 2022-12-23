class LeanSuccessResponse {
  String? status;
  String? secondaryStatus;
  String? message;
  String? lastApiResponse;
  String? exitPoint;
  Bank? bank;
  String? method;

  LeanSuccessResponse(
      {this.status,
        this.secondaryStatus,
        this.message,
        this.lastApiResponse,
        this.exitPoint,
        this.bank,
        this.method});

  static LeanSuccessResponse empty(){
    return LeanSuccessResponse(
      secondaryStatus: '',
      status: '',
      method: '',
      lastApiResponse: '',
      exitPoint: '',
      message: '',
      bank: Bank.empty(),
    );
  }

  LeanSuccessResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    secondaryStatus = json['secondary_status'];
    message = json['message'];
    lastApiResponse = json['last_api_response'];
    exitPoint = json['exit_point'];
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['secondary_status'] = this.secondaryStatus;
    data['message'] = this.message;
    data['last_api_response'] = this.lastApiResponse;
    data['exit_point'] = this.exitPoint;
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    data['method'] = this.method;
    return data;
  }
}

class Bank {
  String? bankIdentifier;
  bool? isSupported;

  Bank({this.bankIdentifier, this.isSupported});

  static Bank empty(){
    return Bank(
      isSupported: false,
      bankIdentifier: '',
    );
  }

  Bank.fromJson(Map<String, dynamic> json) {
    bankIdentifier = json['bank_identifier'];
    isSupported = json['is_supported'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_identifier'] = this.bankIdentifier;
    data['is_supported'] = this.isSupported;
    return data;
  }
}