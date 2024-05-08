
import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class FullWidthConfirmButton extends StatelessWidget {
  FullWidthConfirmButton({super.key, this.fillColor = ThemeHelper.blueMunicipium, this.textColor = Colors.white, required this.isEnabled, required this.onTap, this.text = 'Conferma', this.height = 50} );
  final Color fillColor;
  final Color textColor;
  final bool isEnabled;
  final double height;
  final GestureTapCallback onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: fillColor, borderRadius: BorderRadius.circular(12)),
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Center(child: Text(text, style: TextStyle(color: textColor),)),
        
      ),
    );
  }
}