import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:municipium/routers/app_router.gr.dart';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class QrEcoattiviPage extends StatefulWidget {
  const QrEcoattiviPage({super.key});

  @override
  State<QrEcoattiviPage> createState() => _QrEcoattiviPageState();
}

class _QrEcoattiviPageState extends State<QrEcoattiviPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scannedCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: Container(
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
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
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
                  controller?.toggleFlash();
                },
                child: const Icon(Icons.flashlight_on),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      print("Codice rilevato: ${scanData.code}");
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
