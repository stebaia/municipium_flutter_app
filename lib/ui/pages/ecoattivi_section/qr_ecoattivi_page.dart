import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:municipium/bloc/bloc/ecoattivi_qr_bloc/ecoattivi_qr_bloc.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_qr_body.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class QrEcoattiviPage extends StatelessWidget implements AutoRouteWrapper {
  final String? token;
  const QrEcoattiviPage({super.key, required this.token});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EcoattiviQrBloc>(
          create: (context) =>
              EcoattiviQrBloc(ecoattiviRepository: context.read()),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MobileScannerController controller = MobileScannerController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr scan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: BlocListener<EcoattiviQrBloc, EcoattiviQrState>(
        listener: (context, state) {
          if (state is EcoattiviQrSuccess) {
            switch (state.response.resultCode) {
              case 0:
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Column(
                            children: [
                              Text(state.response.titolo ?? ''),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(state.response.messaggioSociale ?? '')
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Ok"))
                          ],
                        ));
              case 1:
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Column(
                            children: [
                              Text('Errore'),
                              const SizedBox(
                                height: 24,
                              ),
                              Text('Localizzazione errata o non attiva')
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Ok"))
                          ],
                        ));
              case 2:
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Column(
                            children: [
                              Text('Errore'),
                              const SizedBox(
                                height: 24,
                              ),
                              Text('Qr code errato o non attivo')
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Ok"))
                          ],
                        ));
              default:
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Column(
                            children: [
                              Text('Errore'),
                              const SizedBox(
                                height: 24,
                              ),
                              Text('Errore generico')
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Ok"))
                          ],
                        ));
            }
          }
        },
        child: Container(
          color: Colors.grey[300], // Sfondo grigio
          child: Stack(
            children: [
              // Quadrato spostato più in alto
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15, // 20% dall'alto
                left: MediaQuery.of(context).size.width / 2 -
                    150, // Centrato orizzontalmente
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Quadrato del lettore QR
                    Container(
                      width: 250,
                      height: 250,
                      child: MobileScanner(
                        controller: controller,
                        onDetect: (code) =>
                            _handleCode(context, code), // Gestione QR con Bloc
                      ),
                    ),
                    // Linee interrotte staccate
                    CustomPaint(
                      size: const Size(
                          300, 300), // Aumentato per dare spazio alle linee
                      painter: BorderPainter(),
                    ),
                  ],
                ),
              ),
              // Pulsante torcia
              Positioned(
                bottom: 100,
                left: MediaQuery.of(context).size.width / 2 - 30,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.toggleTorch();
                  },
                  child: const Icon(Icons.flashlight_on),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCode(BuildContext context, BarcodeCapture code) async {
    final Barcode? scannedCode = code.barcodes.firstOrNull;
    if (scannedCode != null) {
      // Invia un evento al Bloc
      Position? position = await getCurrentPosition();
      if (position != null) {
        context.read<EcoattiviQrBloc>().registrationQr(
            Provider.of<BaseUrlNotifier>(context, listen: false)
                .baseUrlEcoattivi,
            token ?? '',
            Provider.of<BaseUrlNotifier>(context, listen: false).guidEcoattivi,
            EcoattiviQrBody(
                lat: position.latitude,
                lon: position.longitude,
                qrCode: scannedCode.rawValue));
      }
    }
  }

  Future<Position?> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se il servizio di localizzazione è abilitato
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Il servizio di localizzazione non è abilitato
      print('Il servizio di localizzazione è disabilitato.');
      return null;
    }

    // Verifica lo stato dei permessi di localizzazione
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permessi negati
        print('I permessi di localizzazione sono stati negati.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permessi negati permanentemente
      print(
          'I permessi di localizzazione sono stati negati permanentemente. Impossibile richiedere i permessi.');
      return null;
    }

    // Ottieni la posizione attuale
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const double cornerLength = 30; // Lunghezza delle linee agli angoli
    const double strokeWidth = 4;

    // Linee in alto a sinistra
    canvas.drawLine(
        Offset(0, 0), Offset(cornerLength, 0), paint); // Linea orizzontale
    canvas.drawLine(
        Offset(0, 0), Offset(0, cornerLength), paint); // Linea verticale

    // Linee in alto a destra
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width - cornerLength, 0), paint);
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, cornerLength), paint);

    // Linee in basso a sinistra
    canvas.drawLine(
        Offset(0, size.height), Offset(cornerLength, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(0, size.height - cornerLength), paint);

    // Linee in basso a destra
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - cornerLength, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - cornerLength), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
