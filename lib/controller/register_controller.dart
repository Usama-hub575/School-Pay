import 'dart:convert';

import 'package:get/get.dart';
import 'package:paynest_flutter_app/model/register_model.dart';
import 'package:paynest_flutter_app/model/register_resp_model.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final isFailed = "".obs;
  final registerResData =
      RegisterRespModel(status: false, message: null, token: null, parent: null)
          .obs;
}
