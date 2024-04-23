import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuRow extends StatelessWidget {
  const MenuRow(
      {super.key,
      required this.textToShow,
      required this.onTapMethod,
      required this.sizeFont,
      this.icon,
      this.showIconArrow = false});
  final String textToShow;
  final Function()? onTapMethod;
  final double sizeFont;
  final IconData? icon;
  final bool showIconArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTapMethod,
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon),
              const SizedBox(width: 16),
            ],
            Text(textToShow,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: sizeFont)),
            const SizedBox(width: 12),
            if (showIconArrow) const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
