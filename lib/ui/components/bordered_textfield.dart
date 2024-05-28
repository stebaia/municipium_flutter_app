import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class BorderedTextfield extends StatelessWidget {
  BorderedTextfield(
      {super.key,
      this.title,
      this.customIcon,
      this.placeHolder,
      this.onChanged,
      this.height,
      this.value,
      this.keyboardType});

  String? title;
  IconButton? customIcon;
  String? placeHolder;
  Function(String)? onChanged;
  double? height;
  String? value;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: ThemeHelper.lightGrey),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        initialValue: value,
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: customIcon,
            hintText: placeHolder,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: ThemeHelper.lightGrey)),
      ),
    );
  }
}
