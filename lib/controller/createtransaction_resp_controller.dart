import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/model/createtransaction_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';
import 'package:xml2json/xml2json.dart';

class CreateTransactionRespController extends GetxController {
  var isLoading = false.obs;
  final createTransData = CreateTransactionResModel(
    status: false,
    transaction: '',
  ).obs;

  // schoolId=56&parentId=225&InvoiceId=452&studentId=638

  Future<bool> hitCreateTransaction(
    schoolId,
    parentId,
    studentId,
    amount,
    orderId,
  ) async {
    try {
      isLoading(true);
      final data = {
        "schoolId": schoolId,
        "parentId": parentId,
        "studentId": studentId,
        "amount": amount,
        "orderId": orderId,
      };
      var res = await APIService().apiCreateTransaction(data);
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
      } else if (decoded['status'] == false) {
        isLoading(false);
      }
      return decoded['status'];
    } catch (e) {
      print(e);
      isLoading(false);
      return false;
    }
  }
}
