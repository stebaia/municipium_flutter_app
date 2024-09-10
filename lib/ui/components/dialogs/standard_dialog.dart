import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBaseDialog extends StatelessWidget {
  const CustomBaseDialog({super.key, required this.callback, required this.title, required this.description});
  final VoidCallback callback;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.titleLarge,),
      content: Text(description, style: Theme.of(context).textTheme.bodyMedium,),
      actions: [
        TextButton(onPressed: () => Navigator.maybePop(context), child: Text(AppLocalizations.of(context)!.text_no)),
        ElevatedButton(onPressed: callback, child: Text(AppLocalizations.of(context)!.text_yes))
      ],
    );

  }
}