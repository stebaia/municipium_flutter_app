import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ItemWeatherQualityComponent(
    double aqi, String name, BuildContext context) {
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

  return Container(
    padding: const EdgeInsets.all(20),
    width: MediaQuery.of(context).size.width,
    height: 130,
    decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    aqi.round().toString(),
                    
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    ' /300',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
             
                LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(4),
                          value: aqi / 300, // Assumendo che l'intervallo AQI sia 0-300
                          minHeight: 10,
                          backgroundColor: color.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
            
            ],
          ),
        ),
      ],
    ),
  );
}
