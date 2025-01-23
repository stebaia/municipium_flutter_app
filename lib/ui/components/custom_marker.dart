import 'package:flutter/material.dart';

class CustomMarker extends StatelessWidget {
  final Color markerColor;

  const CustomMarker({Key? key, required this.markerColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 50, // Dimensione interna leggermente più piccola
          color: markerColor,
        ),
        // Bordo esterno (colore pieno)
        Icon(
          Icons.location_on,
          size: 50, // Dimensione personalizzabile
          color: markerColor.withOpacity(0.7),
        ),
        // Interno più chiaro (tonalità trasparente)
      ],
    );
  }
}
