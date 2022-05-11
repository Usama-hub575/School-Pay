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

  // final int resID;
  final String amount;
  final int indx;
  final int orderId;
  final int schoolId;

  MyWebView({
    required this.title,
    // required this.resID,
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
    // TODO: implement initState
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    paymentGateWay =
        "https://discoveritech.com/BorderPay_Payment_Api/border_request_copy.php?schoolId=${widget.schoolId}&amount=${widget.amount}&orderid=${widget.orderId}";
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
        onProgress: (value) {
          // setState(() {
          //   isLoading = false;
          // });
        },
        onPageStarted: (url) {
          // setState(() {
          //   isLoading = true;
          // });
          print('on page start allowing navigation to $url');
          if (url ==
              "https://discoveritech.com/BorderPay_Payment_Api/ReceiveResult.php") {
            Navigator.pop(context);
          }
          // I/flutter (26486): on page start allowing navigation to https://discoveritech.com/BorderPay_Payment_Api/ReceiveResult.php
          // I/chromium(26486): [INFO:CONSOLE(2)] "JQMIGRATE: Migrate is installed, version 3.3.2", source: https://discoveritech.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.3.2 (2)
        },
        onPageFinished: (url) async {
          // setState(() {
          //   isLoading = false;
          // });
          print('on page finish allowing navigation to $url');
          // 'https://discoveritech.com/schoolpay-transactions/PaymentInitiator.php'
          if (url.contains(
              'https://discoveritech.com/schoolpay-transactions/cdb_recieve.php?')) {
            print('got it');
            isCodeReceived = true;
            var CBDReferenceNo =
                getResponse(Uri.parse(url).queryParameters['string'] ?? '');
            print("This is Parsed");
            print(Uri.parse(url).queryParameters['string']);
            if (CBDReferenceNo != null) {
              var decoded = jsonDecode(CBDReferenceNo);
              print("This is response");
              print(CBDReferenceNo);
              if (decoded["Response"]["Header"]["ResponseCode"] == "00") {
                // await sbrController.hitSetBankResponse(
                //     widget.resID, CBDReferenceNo);
                studentController.myStudentData.update((val) {
                  val!.students![widget.indx].student!.totalBalanceAmount = "0";
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Amount Updated'),
                  backgroundColor: Colors.green,
                ));
                // studentController.myStudentData.value.students![index].student!.totalBalanceAmount
                !sbrController.isLoading.value
                    ? Navigator.pop(context, CBDReferenceNo)
                    : null;
              } else {
                // await sbrController.hitSetBankResponse(
                //     widget.resID, CBDReferenceNo);
                // studentController.myStudentData.value.students![index].student!.totalBalanceAmount
                !sbrController.isLoading.value ? Navigator.pop(context) : null;

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(decoded['Response']['Header']['ResponseMsg']),
                  backgroundColor: Colors.red,
                ));
              }
            }
          }
        },
        navigationDelegate: (NavigationRequest request) {
          print('on delegate allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),

      // {
      //   "Response":{
      //     "Header":{
      //       "ResponseCode":"00",
      //       "ResponseMsg":"success"
      //     },
      //     "Body":{
      //       "PaymentInformation":{
      //         "CBDReferenceNo":245863,
      //         "CCReferenceNo":6498840915556097804006,
      //         "AuthCode":831000,
      //         "OrderID":18952477,
      //         "AuthorizationDateTime":"4/14/2022 1 : 08 :12 AM",
      //         "CardType":"001",
      //         "MaskedCardNumber":"xxxxxxxxxxxx1111",
      //         "TokenizedValue":null
      //       }
      //     }
      //   }
      // }
      // WebView(
      //   initialUrl: widget.selectedUrl,
      //   javascriptMode: JavascriptMode.unrestricted,
      //   onWebViewCreated: (WebViewController webViewController) {
      //     _controller.complete(webViewController);
      //   },
      //   navigationDelegate: (request){
      //     print(request);
      //     return NavigationDecision.navigate;
      //   },
      //   onPageFinished: (value){
      //     print("Finished");
      //     print(value);
      //   },
      // )
    );
  }

  getResponse(String response) {
    response = response.replaceAll('\\', '');
    response = response.replaceAll('\"', '');
    myTransformer.parse(response);
    var jsonString = myTransformer.toParker();
    print("myDATA");
    print(jsonString);
    // var data = jsonDecode(jsonString);
    // return data['Response']['Header']['ResponseCode'];
    return jsonString;
  }
}
