import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/model/ecoattivi/ecocard_body.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/ecoattivi/ecocard.dart';

@RoutePage()
class EcopointGridPage extends StatelessWidget {
  final String token;
  final EcoattiviSituazioneUtente situazioneUtente;
  const EcopointGridPage(
      {super.key, required this.token, required this.situazioneUtente});

  @override
  Widget build(BuildContext context) {
    List<EcocardBody> items = [
      EcocardBody(
        imagePath:
            'assets/images/ecoattivi_quiz_home.png', // Percorso dell'immagine
        title: 'Quiz',
        badgeCount: situazioneUtente.quizDaFare ?? -1,
        onPressed: () {
          context.pushRoute(QuizListEcoattiviRoute(token: token));
          // Azione per il quiz
        },
      ),
      EcocardBody(
        imagePath: 'assets/images/ecoattivi_qr_home.png', // Percorso immagine
        title: 'QR Code',
        badgeCount: 0,
        onPressed: () {
          context.pushRoute(QrEcoattiviRoute(token: token));
          // Azione per Invita un amico
        },
      ),
      EcocardBody(
        imagePath:
            'assets/images/ecoattivi_invite_friend_home.png', // Percorso immagine
        title: 'Invita un amico',
        badgeCount: 0,
        onPressed: () {
          context.pushRoute(InviteFriendRoute(
              code: situazioneUtente.codiceAmico ?? '',
              punti: situazioneUtente.puntiInvitaAmico ?? 100));
          // Azione per Invita un amico
        },
      ),
      EcocardBody(
        imagePath:
            'assets/images/ecoattivi_photo_home.png', // Percorso immagine
        title: 'Carica foto',
        badgeCount: 0,
        onPressed: () {
          context.pushRoute(EcoPhotoSection(token: token));
          // Azione per Invita un amico
        },
      ),
      EcocardBody(
        imagePath:
            'assets/images/ecoattivi_missions_home.png', // Percorso immagine
        title: 'Missioni',
        badgeCount: situazioneUtente.missioniDaFare ?? -1,
        onPressed: () {
          // Azione per Invita un amico
        },
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Guadagna ecopunti'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Due elementi per riga
              crossAxisSpacing: 10, // Spaziatura orizzontale
              mainAxisSpacing: 10, // Spaziatura verticale
              mainAxisExtent: 230),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Ecocard(body: items[index]);
          }),
    );
  }
}
