import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:municipium/ui/components/webview/custom_webview.dart';

@RoutePage()
class PnrrDetailWebviewPage extends StatefulWidget {
  PnrrDetailWebviewPage({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  State<PnrrDetailWebviewPage> createState() => _PnrrDetailWebviewState();
}

class _PnrrDetailWebviewState extends State<PnrrDetailWebviewPage> {
  CustomWebView? webView;
  bool pageLoaded = false;
  double? progressValue;

  @override
  void initState() {
    super.initState();
    webView = CustomWebView(
      url: widget.url,
      onProgress: (progress) {
        setState(() {
          progressValue = (progress.toDouble());
          if (progress == 100) {
            pageLoaded = true;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: pageLoaded
          ? webView
          : Center(
              child: CircularProgressIndicator(
              value: progressValue != null ? progressValue! / 100 : null,
            )),
    );
  }
}
