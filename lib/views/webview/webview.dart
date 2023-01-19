import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/service/api_service.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xml2json/xml2json.dart';

class MyWebView extends StatefulWidget {
  final String title;

  final String amount;
  final int indx;
  final int orderId;
  final int schoolId;

  MyWebView({
    required this.title,
    required this.amount,
    required this.indx,
    required this.orderId,
    required this.schoolId,
  });

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final MyStudentController studentController = Get.find<MyStudentController>();

  WebViewController? _controller = null;

  String url = "";

  late String paymentGateWay;
  final myTransformer = Xml2Json();
  bool isLoading = false;
  bool isCodeReceived = false;
  var gateway;

  @override
  void initState() {
    super.initState();
    gateway = APIService.paymentGatewayUrl;
    paymentGateWay =
        "$gateway?amount=${widget.amount}&orderId=${widget.orderId}&schoolId=${widget.schoolId}";
    print(paymentGateWay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PayNestTheme.primaryColor,
        title: Text(widget.title, style: PayNestTheme.title20white),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: WebView(
        initialUrl: paymentGateWay,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) =>
            _controller = webViewController,
        onProgress: (value) {},
        onPageStarted: (url) {},
        onPageFinished: (url) async {
          print('on page finish allowing navigation to $url');
          String comparedGatewayUrl = gateway.toString() + "-receive?";
          if (url.contains(comparedGatewayUrl)) {
            print('got it');
            isCodeReceived = true;
            // var CBDReferenceNo =
            //     getResponse(Uri.parse(url).queryParameters['string'] ?? '');
            if (Uri.parse(url).queryParameters['status'] != null) {
              Navigator.of(context).pop(
                Uri.parse(url).queryParameters['status'] == 'true'
                    ? true
                    : false,
              );
            } else {
              Navigator.of(context).pop(false);
              // var decoded = jsonDecode(CBDReferenceNo);
              // showToast(
              //   messege: decoded['Response']['Header']['ResponseMsg'],
              //   context: context,
              //   color: PayNestTheme.red,
              // );
            }
          }
        },
        navigationDelegate: (NavigationRequest request) {
          print('on delegate allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  getResponse(String response) {
    response = response.replaceAll('\\', '');
    response = response.replaceAll('\"', '');
    myTransformer.parse(response);
    var jsonString = myTransformer.toParker();
    print(jsonString);
    return response;
  }
}
