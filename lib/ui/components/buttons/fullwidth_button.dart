
import 'package:flutter/material.dart';

class FullWidthConfirmButton extends StatelessWidget {
  const FullWidthConfirmButton({super.key, this.fillColor = Colors.blue, this.textColor = Colors.white, required this.isEnabled, required this.onTap} );
  final Color fillColor;
  final Color textColor;
  final bool isEnabled;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: fillColor, borderRadius: BorderRadius.circular(12)),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(child: Text('Conferma', style: TextStyle(color: textColor),)),
        
      ),
    );
  }
}