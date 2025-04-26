import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import '../../../HomeFeature/ui/screens/imports_home_screen.dart';
import '../../../jobs/bloc/controller/fetch_myjobs_controller.dart';
import 'job_app_payment_screen.dart';

class PaymentWebView extends StatefulWidget {
  String? url;
  int? job_id;

  PaymentWebView({Key? key, this.url, this.job_id}) : super(key: key);

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  WebViewController? _webViewController;

  Future<void> getServerResponse(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      debugPrint(response.body);
    } catch (error) {
      log(error.toString());
      debugPrint(error.toString());
    }
  }

  @override
  void initState() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            log("progress  === > $progress");
          },
          onPageStarted: (String url) {
            log("onPageStarted  === > $url");
          },
          onPageFinished: (String url) {
            log("onPageFinished  === > $url");
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            getServerResponse(request.url);
            print('this is NavigationRequest ${request.url}}');
            if (request.url.contains('Failure')) {
              print('blocking navigation to $request}');
              Navigator.pop(context);
              Get.snackbar(
                "Failure",
                "Payment Failure something want wrong",
                colorText: Colors.white,
                backgroundColor: Colors.red,
                icon: const Icon(Icons.error),
              );
              Get.to(CompanyHomeScreen());
              // _.fetchJobs();
              FetchMyJobsController().fetchJobs();
              return NavigationDecision.prevent;
            } else if (request.url.contains('Successful')) {
              print('blocking navigation to $request}');
              Navigator.pop(context);
              Get.snackbar(
                "Success",
                "Payment done Successfully",
                colorText: Colors.white,
                backgroundColor: Colors.green,
                icon: const Icon(Icons.error),
              );
              Get.to(JobAppPaymentScreen());
              // _.fetchJobs();
              FetchMyJobsController().fetchJobs();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url!))
      ..currentUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("this is payment Link ${widget.url}");

    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: WebViewWidget(controller: _webViewController!),
          ),
        ),
      );
    });
  }
}
