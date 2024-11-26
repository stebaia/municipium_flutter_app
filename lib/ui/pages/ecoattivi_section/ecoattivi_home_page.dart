import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/bloc/user_bloc/user_bloc.dart';
import 'package:municipium/bloc/cubit/checkbox_cubit/checkbox_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/blue_background_painter.dart';
import 'package:municipium/ui/components/dialog_builder.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EcoattiviHomePage extends StatelessWidget {
  const EcoattiviHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Ecoattivi'),
        leading: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(userRepository: context.read()),
        child: BlocBuilder<UserDataCubit, SpidUserModel?>(
          builder: (context, userSpid) {
            if (userSpid!.authId != null) {
              context.read<UserBloc>().validatedUser(
                  Provider.of<BaseUrlNotifier>(context, listen: false)
                      .baseUrlMmc,
                  userSpid,
                  '',
                  municipality.istat,
                  userSpid.authId ?? '',
                  false);
              return BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is FetchedValidateUserState) {
                    if (state.userValidated.data != null) {
                      //dialogBuilder(context);
                    } else if (state.userValidated.errorCode == 2) {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return BlocProvider(
                            create: (dialogContext) => CheckboxCubit(),
                            child: BlocBuilder<CheckboxCubit, bool>(
                              builder: (checkContext, checkboxValue) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    // Imposta una larghezza fissa per il dialog
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Non occupa tutto lo spazio disponibile
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Accetta il regolamento",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: checkboxValue,
                                              onChanged: (value) => checkContext
                                                  .read<CheckboxCubit>()
                                                  .setChecked(value!),
                                            ),
                                            const SizedBox(width: 16),
                                            const Expanded(
                                              child: Text(
                                                'Accetta il regolamento e privacy per accedere alla sezione Ecoattivi e poter partecipare ai concorsi a premi',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (checkboxValue)
                                              TextButton(
                                                child: Text("Avanti"),
                                                onPressed: () async {
                                                  context
                                                      .read<UserBloc>()
                                                      .validatedUser(
                                                          Provider.of<BaseUrlNotifier>(
                                                                  context,
                                                                  listen: false)
                                                              .baseUrlMmc,
                                                          userSpid,
                                                          '',
                                                          municipality.istat,
                                                          userSpid.authId ?? '',
                                                          true);
                                                  Navigator.of(context)
                                                      .pop(); // Chiude il popup
                                                },
                                              ),
                                            TextButton(
                                              child: Text("Chiudi"),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Chiude il popup
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      print("error: ${state.userValidated.errorMessage ?? ''}");
                    }
                  } else {}
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/ecoattivi_icon_home.png",
                              fit: BoxFit
                                  .cover, // Regola il comportamento dell'immagine
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Expanded(
                              child: Text(
                                'Ciao, utente del cazzo Ciao, utente del cazzo Ciao, utente del cazzo',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Guadagna ecopunti e partecipa ai concorsi',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Termini e regolamento',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Privacy policy e regolamento',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildImageButton(
                                "assets/images/ecoattivi_premi_home.png",
                                "Premi"),
                            _buildImageButton(
                                "assets/images/ecoattivi_location_home.png",
                                "Ecomappa"),
                            _buildImageButton(
                                "assets/images/ecoattivi_ranking_home.png",
                                "Ranking"),
                            _buildImageButtonWithBadge(
                              "assets/images/ecoattivi_message_home.png",
                              "Messaggi",
                              4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Guadagna ecopunti',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Azione per "Vedi tutti"
                              },
                              child: const Text(
                                'Vedi tutti',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildEcoCard(
                                imagePath:
                                    'assets/images/ecoattivi_quiz_home.png', // Percorso dell'immagine
                                title: 'Quiz',
                                badgeCount: 52,
                                onPressed: () {
                                  // Azione per il quiz
                                },
                              ),
                              const SizedBox(width: 16),
                              _buildEcoCard(
                                imagePath:
                                    'assets/images/ecoattivi_qr_home.png', // Percorso immagine
                                title: 'QR Code',
                                badgeCount: 10,
                                onPressed: () {
                                  // Azione per Invita un amico
                                },
                              ),
                              const SizedBox(width: 16),
                              _buildEcoCard(
                                imagePath:
                                    'assets/images/ecoattivi_invite_friend_home.png', // Percorso immagine
                                title: 'Invita un amico',
                                badgeCount: 10,
                                onPressed: () {
                                  // Azione per Invita un amico
                                },
                              ),
                              const SizedBox(width: 16),
                              _buildEcoCard(
                                imagePath:
                                    'assets/images/ecoattivi_photo_home.png', // Percorso immagine
                                title: 'Carica foto',
                                badgeCount: 10,
                                onPressed: () {
                                  // Azione per Invita un amico
                                },
                              ),
                              const SizedBox(width: 16),
                              _buildEcoCard(
                                imagePath:
                                    'assets/images/ecoattivi_missions_home.png', // Percorso immagine
                                title: 'Missioni',
                                badgeCount: 10,
                                onPressed: () {
                                  // Azione per Invita un amico
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .text_login_title_personal_area,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .text_login_subtitle_personal_area,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => context.pushRoute(
                              LoginSpidIdpListRoute(ecoattivi: true)),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 200,
                            height: 140,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).disabledColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.person),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(AppLocalizations.of(context)!
                                    .text_spid_title)
                              ],
                            ),
                          ),
                        ),
                        /*Expanded(child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).cardColor),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [],
                                ),
                              ))*/
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildImageButton(String imagePath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 60, // Dimensione dell'immagine
          height: 60,
          fit: BoxFit.cover, // Adatta l'immagine
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildImageButtonWithBadge(
      String imagePath, String label, int badgeCount) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildImageButton(imagePath, label),
        Positioned(
          top: -4,
          right: -4,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$badgeCount',
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
    );
  }

  Widget _buildEcoCard({
    required String imagePath,
    required String title,
    required int badgeCount,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: onPressed,
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
                        imagePath,
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
                          title,
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
              if (badgeCount > 0)
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
                        '$badgeCount',
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
