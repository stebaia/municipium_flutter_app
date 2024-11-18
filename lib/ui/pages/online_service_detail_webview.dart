import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:municipium/ui/components/webview/custom_webview.dart';

@RoutePage()
class OnlineServiceDetailWebviewPage extends StatefulWidget {
  OnlineServiceDetailWebviewPage({Key? key, required this.url, required this.name}) : super(key: key);
  String url;
  String name;

  @override
  State<OnlineServiceDetailWebviewPage> createState() => _OnlineServiceDetailWebviewPage();
}

class _OnlineServiceDetailWebviewPage extends State<OnlineServiceDetailWebviewPage> {
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
        
        centerTitle: true,
            title: Text(
              widget.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
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
