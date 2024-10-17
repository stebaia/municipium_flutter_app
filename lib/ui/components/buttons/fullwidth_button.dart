
import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class FullWidthConfirmButton extends StatelessWidget {
  FullWidthConfirmButton({super.key, this.fillColor = ThemeHelper.blueMunicipium, this.textColor = Colors.white, required this.isEnabled, required this.onTap, this.text = 'Conferma', this.height = 40} );
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
        decoration: BoxDecoration(color: fillColor, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Center(child: Text(text, style: TextStyle(color: textColor),)),
        
      ),
    );
  }
}

class FullWidthConfirmSecondButton extends StatelessWidget {
  FullWidthConfirmSecondButton({super.key, this.fillColor = ThemeHelper.blueMunicipium, this.textColor = Colors.white, required this.isEnabled, required this.onTap, this.text = 'Conferma', this.height = 40, this.iconData} );
  final Color fillColor;
  final Color textColor;
  final bool isEnabled;
  final double height;
  final IconData? iconData;
  final GestureTapCallback onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor), borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null ? Icon(iconData) : Container(),
            iconData != null ? const SizedBox(width: 4,) : Container(),
            Text(text, style: TextStyle(color: textColor),),
            
          ],
        )),
        
      ),
    );
  }
}