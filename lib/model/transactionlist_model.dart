// To parse this JSON data, do
//
//     final transactionListModel = transactionListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TransactionListModel transactionListModelFromJson(String str) => TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) => json.encode(data.toJson());

class TransactionListModel {
  TransactionListModel({
    required this.parentId,
  });

  String parentId;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) => TransactionListModel(
    parentId: json["parentId"],
  );

  Map<String, dynamic> toJson() => {
    "parentId": parentId,
  };
}
