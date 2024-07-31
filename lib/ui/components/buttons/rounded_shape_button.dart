import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class RoundedShapeButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final String title;

  const RoundedShapeButton(
      {super.key,
      this.color,
      this.textColor,
      this.borderColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(12),
          color: color ?? ThemeHelper.blueMunicipium),
      child: Text(
        title,
        style: TextStyle(color: textColor ?? Colors.white, letterSpacing: -0.4),
      ),
    );
  }
}
