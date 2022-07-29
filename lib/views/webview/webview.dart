import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/updatebank_response_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
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
  final SetBankResponseController sbrController =
      Get.find<SetBankResponseController>();
  final MyStudentController studentController = Get.find<MyStudentController>();

  // final Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController? _controller = null;

  String url = "";

  late String paymentGateWay;
  final myTransformer = Xml2Json();
  bool isLoading = false;
  bool isCodeReceived = false;

  @override
  void initState() {
    super.initState();
    paymentGateWay =
        "https://discoveritech.com/schoolpay-transactions/school_pay_init_new.php?schoolId=${widget.schoolId}&amount=${widget.amount}&orderid=${widget.orderId}";
    print(paymentGateWay);
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
        initialUrl: paymentGateWay,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) =>
            _controller = webViewController,
        onProgress: (value) {},
        onPageStarted: (url) {
          print('on page start allowing navigation to $url');
          if (url ==
              "https://discoveritech.com/BorderPay_Payment_Api/ReceiveResult.php") {
            Navigator.pop(context);
          }
        },
        onPageFinished: (url) async {
          print('on page finish allowing navigation to $url');
          // 'https://discoveritech.com/schoolpay-transactions/PaymentInitiator.php'
          if (url.contains(
              'https://discoveritech.com/BorderPay_Payment_Api/cdb_recieve.php?')) {
            print('got it');
            isCodeReceived = true;
            var CBDReferenceNo =
                getResponse(Uri.parse(url).queryParameters['string'] ?? '');
            print("This is Parsed");
            print(Uri.parse(url).queryParameters['string']);
            if (CBDReferenceNo != null) {
              Navigator.of(context, rootNavigator: true).pop(CBDReferenceNo);
            } else {
              var decoded = jsonDecode(CBDReferenceNo);
              !sbrController.isLoading.value ? Navigator.pop(context) : null;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(decoded['Response']['Header']['ResponseMsg']),
                backgroundColor: Colors.red,
              ));
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
