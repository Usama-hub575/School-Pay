class CreatePaymentIntentModel {
  bool? status;
  String? statusMsg;
  CreatePaymentIntentData? data;

  CreatePaymentIntentModel({this.status, this.statusMsg, this.data});

  CreatePaymentIntentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    data = json['data'] != null ? new CreatePaymentIntentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusMsg'] = this.statusMsg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CreatePaymentIntentData {
  String? paymentIntentId;
  String? leanAppToken;

  CreatePaymentIntentData({this.paymentIntentId, this.leanAppToken});

  CreatePaymentIntentData.fromJson(Map<String, dynamic> json) {
    paymentIntentId = json['paymentIntentId'];
    leanAppToken = json['leanAppToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentIntentId'] = this.paymentIntentId;
    data['leanAppToken'] = this.leanAppToken;
    return data;
  }
}
