import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceOnlineDetailPage extends StatefulWidget {
  const ServiceOnlineDetailPage({super.key, required this.name, required this.link});
  final String name;
  final String link;
  @override
  State<ServiceOnlineDetailPage> createState() => _ServiceOnlineDetailPageState();
}

class _ServiceOnlineDetailPageState extends State<ServiceOnlineDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.services_menu.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ),
    );
  }
}