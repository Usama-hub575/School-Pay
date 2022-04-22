// To parse this JSON data, do
//
//     final myStudentsModel = myStudentsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyStudentsModel myStudentsModelFromJson(String str) => MyStudentsModel.fromJson(json.decode(str));

String myStudentsModelToJson(MyStudentsModel data) => json.encode(data.toJson());

class MyStudentsModel {
  MyStudentsModel({
    required this.parentId,
  });

  int parentId;

  factory MyStudentsModel.fromJson(Map<String, dynamic> json) => MyStudentsModel(
    parentId: json["parentId"],
  );

  Map<String, dynamic> toJson() => {
    "parentId": parentId,
  };
}
