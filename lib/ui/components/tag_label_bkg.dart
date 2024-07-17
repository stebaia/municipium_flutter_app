import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class TagLabelBkg extends StatelessWidget {
  TagLabelBkg({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromRGBO(204, 223, 255, 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Text(
          title,
          style: const TextStyle(
              color: ThemeHelper.blueMunicipium,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
