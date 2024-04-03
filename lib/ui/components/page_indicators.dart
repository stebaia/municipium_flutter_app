import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundedIndicator extends StatelessWidget {
  RoundedIndicator({super.key, required this.indicatorColor});
  Color indicatorColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16.0,
      height: 16.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: indicatorColor
      ),
    );
  }
}
