import 'package:flutter/material.dart';

class BlueBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0057FF);

    final path = Path()
      ..moveTo(0, size.height) // Parte bassa sinistra
      ..lineTo(0, size.height / 2) // Linea verticale sinistra
      ..quadraticBezierTo(
        size.width / 2, // Punto di controllo centrale
        0, // Altezza della curva
        size.width, // Fine curva
        size.height / 2, // Altezza destra
      )
      ..lineTo(size.width, size.height) // Linea verticale destra
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
