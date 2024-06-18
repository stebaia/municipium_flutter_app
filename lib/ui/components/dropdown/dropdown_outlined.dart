import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDownOutlined extends StatelessWidget {
  DropDownOutlined(
      {super.key,
      required this.value,
      required this.values,
      required this.onChanged});

  String? value;
  List<DropdownMenuItem<String>> values;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: ThemeHelper.lightGrey),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton<String>(
        underline: Container(),
        hint: Text(
          AppLocalizations.of(context)!.choose_voice,
          style: const TextStyle(
              color: ThemeHelper.lightGrey, letterSpacing: -0.4),
        ),
        isExpanded: true,
        menuMaxHeight: 300,
        value: value, // Valore attualmente selezionato
        onChanged: onChanged,
        items: values,
      ),
    );
  }
}
