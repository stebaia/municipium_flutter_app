import 'package:auto_route/auto_route.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/municipality_components/air_component/circular_indicator_component.dart';
import 'package:municipium/ui/pages/point_of_interest_section/point_of_interest_list_page.dart';

class VerticalBoxAirQualityComponent extends StatelessWidget {
  const VerticalBoxAirQualityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => context.pushRoute(WeatherQualityRoute()),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Qualità aria',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    Text('Bassa',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            height: 1)),
                    Spacer(),
                    const Row(
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                    Spacer(),
                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AirQualityIndicator(180.0, 'PM2.5'),
                          AirQualityIndicator(250.0, 'PM1'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class HorizzontalBoxAirQualityComponent extends StatelessWidget {
  const HorizzontalBoxAirQualityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => context.pushRoute(WeatherQualityRoute()),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.thermostat,
                                size: 16,
                              ),
                              Text(
                                '10°',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.drop,
                                size: 16,
                              ),
                              Text(
                                '30%',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text('Qualità aria',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      Text('Bassa',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AirQualityIndicator(180.0, 'PM2.5'),
                        SizedBox(
                          width: 16,
                        ),
                        AirQualityIndicator(250.0, 'PM1'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
