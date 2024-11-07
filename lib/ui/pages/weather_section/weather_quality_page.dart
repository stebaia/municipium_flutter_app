import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/ui/components/municipality_components/air_component/item_weather_quality_component.dart';

@RoutePage()
class WeatherQualityPage extends StatelessWidget {
  const WeatherQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Qualità dell\'aria'.toUpperCase(),
        style: const TextStyle(fontSize: 20),
      )),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).canvasColor),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qualità aria',
                              style: TextStyle(
                                  fontSize: 14,)),
                          Text('Bassa',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  height: 1)),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 160,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.thermostat,
                                        ),
                                        Text(
                                          '10°',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(CupertinoIcons.drop),
                                        Text(
                                          '30%',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).canvasColor),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ultima rilevazione',
                              style: TextStyle(
                                  fontSize: 14, )),
                          Text('10.57',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  height: 1)),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 160,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   
                                        Text(
                                          'Gio 7 nov',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                     
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            ItemWeatherQualityComponent(20, 'PM2.5', context),
            const SizedBox(height: 10,),
            ItemWeatherQualityComponent(200, 'PM1', context),
            const SizedBox(height: 10,),
            ItemWeatherQualityComponent(150, 'ppb', context),
            const SizedBox(height: 10,),
            ItemWeatherQualityComponent(100, 'CO2', context),
            
          ],
        )),
      ),
    );
  }
}
