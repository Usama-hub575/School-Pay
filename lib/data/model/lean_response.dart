class LeanServerResponse {
  String? status;
  String? secondaryStatus;
  String? message;
  String? lastApiResponse;
  String? exitPoint;
  Bank? bank;
  String? method;

  LeanServerResponse(
      {this.status,
      this.secondaryStatus,
      this.message,
      this.lastApiResponse,
      this.exitPoint,
      this.bank,
      this.method});

  LeanServerResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    secondaryStatus = json['secondary_status'];
    message = json['message'];
    lastApiResponse = json['last_api_response'];
    exitPoint = json['exit_point'];
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['secondary_status'] = secondaryStatus;
    data['message'] = message;
    data['last_api_response'] = lastApiResponse;
    data['exit_point'] = exitPoint;
    if (bank != null) {
      data['bank'] = bank!.toJson();
    }
    data['method'] = method;
    return data;
  }
}

class Bank {
  String? bankIdentifier;
  bool? isSupported;

  Bank({this.bankIdentifier, this.isSupported});

  Bank.fromJson(Map<String, dynamic> json) {
    bankIdentifier = json['bank_identifier'];
    isSupported = json['is_supported'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank_identifier'] = bankIdentifier;
    data['is_supported'] = isSupported;
    return data;
  }
}
