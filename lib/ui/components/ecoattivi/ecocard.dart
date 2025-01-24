import 'package:flutter/material.dart';
import 'package:municipium/model/ecoattivi/ecocard_body.dart';
import 'package:municipium/ui/components/blue_background_painter.dart';

class Ecocard extends StatelessWidget {
  EcocardBody body;

  Ecocard({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: body.onPressed,
        child: Container(
          width: 190,
          height: 215, // Altezza della card
          decoration: BoxDecoration(
            color: Color.fromRGBO(230, 240, 254, 1),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none, // Consente al badge di uscire dai limiti
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Immagine in alto
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        body.imagePath,
                        fit: BoxFit.contain, // L'immagine copre l'intero spazio
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  // Parte blu con forma ellittica in alto
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    child: CustomPaint(
                      size: Size(double.infinity, 50),
                      painter: BlueBackgroundPainter(),
                      child: Container(
                        padding: const EdgeInsets.only(top: 16),
                        height: 50, // Altezza della parte blu
                        alignment: Alignment.center,
                        child: Text(
                          body.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Badge rosso in alto a destra (fuori dalla card)
              if (body.badgeCount > 0)
                Positioned(
                  top: -10, // Parzialmente fuori dalla card
                  right: -10,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${body.badgeCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
