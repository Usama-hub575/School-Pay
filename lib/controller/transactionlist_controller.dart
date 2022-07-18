import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/model/transactionlist_model.dart';
import 'package:paynest_flutter_app/model/transactionlist_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class TransactionListController extends GetxController {
  var isLoading = false.obs;
  var list = {}.obs;
  final transactionListData = TransactionListRespModel(
    status: false,
    transactions: null,
  ).obs;

  hitTransaction(parentID) async {
    try {
      isLoading(true);
      TransactionListModel model = TransactionListModel(parentId: parentID);

      var res = await APIService()
          .apiTransactionList(transactionListModelToJson(model));
      var decoded = jsonDecode(res);
      if (decoded['status'] == true) {
        TransactionListRespModel respModel = transactionListRespModelFromJson(
          res,
        );
        transactionListData.value = respModel;
        for (int i = 0; i < respModel.transactions!.rows!.length; i++) {
          String date = DateFormat("yyyy-MM-dd").format(
            respModel.transactions!.rows![i].payedOn,
          );
          // String storedDate = DateFormat.yMMMMd('en_GB').format(
          //   DateTime.parse(
          //     respModel.transactions!.rows![i].payedOn.toString().substring(0, 10),
          //   ),
          // );
          if (list.containsKey(date)) {
          } else {
            List<TransactionsRow> transactionsList = [];
            for (int j = 0; j < respModel.transactions!.rows!.length; j++) {
              String temp = DateFormat("yyyy-MM-dd").format(
                respModel.transactions!.rows![j].payedOn,
              );
              if (date == temp) {
                transactionsList.add(
                  respModel.transactions!.rows![j],
                );
              }
            }
            list.putIfAbsent(date, () {
              return transactionsList;
            });
          }
        }
        transactionListData.refresh();
        list.refresh();
      } else if (decoded['status'] == false) {
        isLoading(false);
      } else {
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
