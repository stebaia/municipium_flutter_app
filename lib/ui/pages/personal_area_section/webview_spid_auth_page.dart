import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class WebViewSpidAuthPage extends StatefulWidget {
  const WebViewSpidAuthPage({super.key, required this.urlSpid});
  final String urlSpid;

  @override
  State<WebViewSpidAuthPage> createState() => _WebViewSpidAuthPageState();
}

class _WebViewSpidAuthPageState extends State<WebViewSpidAuthPage> {
  late WebViewController webViewController;
  @override
  void initState() {
    webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(widget.urlSpid));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: webViewController),
    );
  }
}