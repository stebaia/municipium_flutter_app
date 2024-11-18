import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoMunicipalityBox extends StatelessWidget {
  const InfoMunicipalityBox({super.key, required this.municipality});
  final Municipality municipality;

  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      '${municipality.logo.baseUrl}${municipality.logo.i1280}'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      municipality.municipalityName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      municipality.municipalityName,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    
                    
                    Text(
                  DateTime.now().day.toString(),
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 4,),
                Column(
                  children: [
                    Text(
                      DateFormat.MMM('it').format(DateTime.now()).toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      DateTime.now().year.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            
            const SizedBox(height: 10,),
            FullWidthConfirmSecondButton(
              iconData: CupertinoIcons.phone,
              text: AppLocalizations.of(context)!.civil_defence_phone_numbers,
              onTap: () {},
              isEnabled: true,
            )
          ],
        ),
      ),
    );
  }
}

class InfoMunicipalityBoxShimmer extends StatelessWidget {
  const InfoMunicipalityBoxShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 34, 34, 34).withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Skeletonizer(
                    enabled: true,
                    child: CircleAvatar(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Skeletonizer(
                    enabled: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(''), Text('')],
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '15°C',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '30',
                    style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'MAR',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '2024',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
