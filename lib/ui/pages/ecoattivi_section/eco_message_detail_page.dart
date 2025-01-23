import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_message.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/webview/custom_webview.dart';

@RoutePage()
class EcoMessageDetailPage extends StatelessWidget {
  final EcoattiviMessage detail;
  final String token;

  const EcoMessageDetailPage(
      {super.key, required this.detail, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.popAndPush(EcoMessageRoute(token: token));
          },
        ),
      ),
      body: CustomWebView(url: detail.url ?? ''),
    );
  }
}
