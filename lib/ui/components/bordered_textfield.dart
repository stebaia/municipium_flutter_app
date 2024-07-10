import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class BorderedTextfield extends StatelessWidget {
  BorderedTextfield(
      {Key? key,
      this.controller,
      this.title,
      this.customIcon,
      this.placeHolder,
      this.onChanged,
      this.onFieldSubmitted,
      this.height,
      this.value,
      this.keyboardType})
      : super(key: key);

  final TextEditingController? controller;
  String? title;
  IconButton? customIcon;
  String? placeHolder;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
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
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            suffixIcon: customIcon,
            hintText: placeHolder,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: ThemeHelper.lightGrey)),
      ),
    );
  }
}
