import 'package:flutter/foundation.dart';

class EcocardBody {
  String imagePath;
  String title;
  int badgeCount;
  VoidCallback onPressed;

  EcocardBody(
      {required this.imagePath,
      required this.title,
      required this.badgeCount,
      required this.onPressed});
}
