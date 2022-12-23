import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/updatebank_response_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    url = widget.leanUrl + '?jwt=' + widget.jwt;
    print(url);
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
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          // Map<String, String> headers = {"jwt": widget.jwt};
          // webViewController.loadUrl(widget.leanUrl, headers: headers);
        },
        onProgress: (value) {},
        onPageStarted: (url) {
          print('on page start allowing navigation to $url');
        },
        onPageFinished: (url) async {
          String result = Uri.parse(url).queryParameters['status'] ?? '';
          if(result != '' && result == 'SUCCESS'){
            Navigator.of(context).pop(true);
          }
        },
        navigationDelegate: (NavigationRequest request) {
          print('on delegate allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
