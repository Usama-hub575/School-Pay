// To parse this JSON data, do
//
//     final payNowResModel = payNowResModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PayNowResModel payNowResModelFromJson(String str) => PayNowResModel.fromJson(json.decode(str));

String payNowResModelToJson(PayNowResModel data) => json.encode(data.toJson());

class PayNowResModel {
  PayNowResModel({
    required this.url,
    required this.hiddendata,
  });

  String url;
  String? hiddendata;

  factory PayNowResModel.fromJson(Map<String, dynamic> json) => PayNowResModel(
    url: json["url"],
    hiddendata: json["hiddendata"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "hiddendata": hiddendata,
  };
}
