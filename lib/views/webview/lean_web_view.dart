import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/updatebank_response_controller.dart';
import 'package:paynest_flutter_app/service/api_service.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xml2json/xml2json.dart';

class LeanWebView extends StatefulWidget {
  String title;
  String leanUrl;
  String jwt;

  LeanWebView({required this.title, required this.leanUrl, required this.jwt});

  @override
  State<LeanWebView> createState() => _LeanWebViewState();
}

class _LeanWebViewState extends State<LeanWebView> {
  final SetBankResponseController sbrController =
      Get.find<SetBankResponseController>();
  final MyStudentController studentController = Get.find<MyStudentController>();

  // final Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController? _controller = null;

  String url = "";

  bool isLoading = false;
  bool isCodeReceived = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PayNestTheme.primaryColor,
        title: Text(widget.title, style: PayNestTheme.title20white),
        centerTitle: true,
        leading: BackButton(),
        automaticallyImplyLeading: false,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          Map<String, String> headers = {"jwt": widget.jwt};
          webViewController.loadUrl(widget.leanUrl, headers: headers);
        },
        onProgress: (value) {},
        onPageStarted: (url) {
          print('on page start allowing navigation to $url');
          if (url ==
              "https://discoveritech.com/BorderPay_Payment_Api/ReceiveResult.php") {
            Navigator.pop(context);
          }
        },
        onPageFinished: (url) async {},
        navigationDelegate: (NavigationRequest request) {
          print('on delegate allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
