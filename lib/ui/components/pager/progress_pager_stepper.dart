import 'package:flutter/material.dart';
import 'package:municipium/utils/theme_helper.dart';

class ProgressPagerStepper extends StatelessWidget {
  ProgressPagerStepper(
      {super.key, required this.totalPage, required this.currentPage});

  int totalPage;
  int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              totalPage,
              (index) {
                bool isColored = index <=
                    currentPage; //lo uso per tenere colorati i tratti precedenti
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: 5,
                      width: (MediaQuery.of(context).size.width -
                              (32 + totalPage * 4)) /
                          totalPage,
                      decoration: BoxDecoration(
                        color: isColored
                            ? ThemeHelper.blueMunicipium
                            : ThemeHelper.lightGrey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(width: 4), // Spazio tra i container
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'Step ${currentPage + 1} di $totalPage',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: -0.4),
              )
            ],
          )
        ],
      ),
    );
  }
}
