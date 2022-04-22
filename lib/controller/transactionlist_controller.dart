import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/transactionlist_model.dart';
import 'package:paynest_flutter_app/model/transactionlist_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class TransactionListController extends GetxController {
  var isLoading = false.obs;
  final transactionListData = TransactionListRespModel(
    status: false,
    transactions: null,
  ).obs;

  hitTransaction(parentID) async {
    try{
      isLoading(true);
      TransactionListModel model = TransactionListModel(
          parentId: parentID
      );

      var res = await APIService().apiTransactionList(transactionListModelToJson(model));
      var decoded = jsonDecode(res);
      if(decoded['status'] == true){
        TransactionListRespModel respModel = transactionListRespModelFromJson(res);
        transactionListData.value = respModel;
        transactionListData.refresh();
      }else if(decoded['status'] == false){
        isLoading(false);
      }else {
        isLoading(false);
      }
    }
    finally{
      isLoading(false);
    }
  }

}