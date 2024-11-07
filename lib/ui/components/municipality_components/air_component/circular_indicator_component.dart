import 'package:flutter/material.dart';

Widget AirQualityIndicator(double aqi, String name) {
  String label;
  Color color;

  if (aqi <= 50) {
    label = 'Buona';
    color = Colors.green;
  } else if (aqi <= 100) {
    label = 'Moderata';
    color = const Color.fromARGB(255, 203, 183, 4);
  } else if (aqi <= 150) {
    label = 'Insalubre per Gruppi Sensibili';
    color = Colors.orange;
  } else if (aqi <= 200) {
    label = 'Insalubre';
    color = Colors.red;
  } else if (aqi <= 300) {
    label = 'Molto Insalubre';
    color = Colors.purple;
  } else {
    label = 'Pericolosa';
    color = Colors.brown;
  }

  return AspectRatio(
    aspectRatio: 1.0,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          value: aqi / 300, // Assumendo che l'intervallo AQI sia 0-300
          strokeWidth: 8,
          backgroundColor: color.withOpacity(0.3),
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${aqi.toInt()}',
                style: TextStyle(
                  height: 1,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
              
              Text(
                name,
                style: TextStyle(
                  fontSize: 10.0,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}