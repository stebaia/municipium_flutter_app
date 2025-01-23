import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/model/civil_defence/civil_defence_are_you_ready.dart';

@RoutePage()
class CivilDefenceAreYouReadyDetailPage extends StatelessWidget {
  const CivilDefenceAreYouReadyDetailPage({super.key, required this.element});

  final CivilDefenceAreYouReady element;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.text_civil_defence_are_you_ready_title_page.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
             padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(element.title!,
                         style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 8,
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "assets/images/${element.image!}.jpg"
                      ,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: element.paragraphs!.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(element.paragraphs![index].title!,
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 8,
                        ),
                        Html(
                          data: element.paragraphs![index].detail!,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
