import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:municipium/ui/components/ecoattivi/ecoattivi_painter_bkg.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class InviteFriendPage extends StatelessWidget {
  final String code;
  final int punti;

  const InviteFriendPage({super.key, required this.code, required this.punti});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invita un amico'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Parte superiore con CustomPainter
            Container(
              width: screenWidth,
              height: screenHeight * 0.5, // Regola l'altezza per adattarla
              child: CustomPaint(
                painter: BackgroundPainter(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Invita un amico e guadagna',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$punti ecopunti',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.blueMunicipium,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Invia il codice ad un amico invitandolo a scaricare l’app Municipium. Inserendo il tuo codice al momento della registrazione guadagnerete entrambi 100 ecopunti.',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Parte inferiore
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Codice amico',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    code,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.blueMunicipium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll<Color>(ThemeHelper.blueMunicipium)),
          onPressed: () => Share.share(
                'Scarica l\'App Municipium andando su https://www.municipiumapp.it/cittadino/#downloadApp e registrati utilizzando il codice amico $code. Guadagnerai 100 punti subito e li farai guadagnare anche a me!',
                subject: 'Condividi link',
              ),
          child: Text('Invita un amico')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
