import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class EcopointsLabel extends StatelessWidget {
  final int punti;
  final bool? showArrow;
  const EcopointsLabel({super.key, required this.punti, this.showArrow});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ThemeHelper.blueMunicipium,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('${punti} ecopunti'),
        ),
        const SizedBox(width: 8),
        if (showArrow ?? true) const Icon(Icons.keyboard_arrow_right_sharp),
      ],
    );
  }
}
