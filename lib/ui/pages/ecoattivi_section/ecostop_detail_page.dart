import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/model/ecoattivi/ecostop.dart';
import 'package:municipium/ui/components/custom_marker.dart';
import 'package:municipium/utils/municipium_utility.dart';

@RoutePage()
class EcostopDetailPage extends StatelessWidget {
  final Ecostop ecostop;

  const EcostopDetailPage({super.key, required this.ecostop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomMarker(
                      markerColor: MunicipiumUtility.hexToColor(
                          ecostop.tipoColore ?? '')),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(ecostop.titolo ?? ''),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(ecostop.indirizzo ?? ''),
              const SizedBox(
                height: 16,
              ),
              Html(data: ecostop.descHtml ?? '')
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight, // Posiziona il FAB in basso a destra
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, right: 8.0),
          child: Container(
            width: 120,
            child: FloatingActionButton(
              onPressed: () {
                print("FAB cliccato!");
              },
              child: const Text('Vedi in mappa',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
