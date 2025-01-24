import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/bloc/ecoattivi_situazioneutente_bloc/ecoattivi_situazioneutente_bloc.dart';
import 'package:municipium/bloc/bloc/request_info_bloc/request_info_bloc.dart';
import 'package:municipium/bloc/bloc/user_bloc/user_bloc.dart';
import 'package:municipium/bloc/cubit/checkbox_cubit/checkbox_cubit.dart';
import 'package:municipium/bloc/cubit/ecoattivi_user_cubit/ecoattivi_user_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_wrapper.dart';
import 'package:municipium/model/ecoattivi/ecocard_body.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/blue_background_painter.dart';
import 'package:municipium/ui/components/dialog_builder.dart';
import 'package:municipium/ui/components/ecoattivi/ecocard.dart';
import 'package:municipium/ui/components/webview/custom_webview.dart';
import 'package:municipium/ui/pages/ecoattivi_section/invite_friend_page.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EcoattiviHomePage extends StatelessWidget {
  const EcoattiviHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? token;
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    final user = context.read<UserDataCubit>().state;
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
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UserBloc(userRepository: context.read()),
            ),
            BlocProvider(
              create: (context) => EcoattiviUserCubit(),
            ),
            BlocProvider(
              create: (context) => EcoattiviSituazioneutenteBloc(
                  ecoattiviRepository: context.read()),
            ),
            BlocProvider(
              create: (context) =>
                  RequestInfoBloc(userRepository: context.read()),
            )
          ],
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
                        token = state.userValidated.data!.token;
                        context
                            .read<EcoattiviSituazioneutenteBloc>()
                            .fetchSituazioneUtente(
                                Provider.of<BaseUrlNotifier>(context,
                                        listen: false)
                                    .baseUrlEcoattivi,
                                state.userValidated.data!.token ?? '',
                                Provider.of<BaseUrlNotifier>(context,
                                        listen: false)
                                    .guidEcoattivi);
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
                                                onChanged: (value) =>
                                                    checkContext
                                                        .read<CheckboxCubit>()
                                                        .setChecked(value!),
                                              ),
                                              const SizedBox(width: 16),
                                              const Expanded(
                                                child: Text(
                                                  'Accetta il regolamento e privacy per accedere alla sezione Ecoattivi e poter partecipare ai concorsi a premi',
                                                  style:
                                                      TextStyle(fontSize: 16),
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
                                                                    listen:
                                                                        false)
                                                                .baseUrlMmc,
                                                            userSpid,
                                                            '',
                                                            municipality.istat,
                                                            userSpid.authId ??
                                                                '',
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
                        print(
                            "error: //${state.userValidated.errorMessage ?? ''}");
                      }
                    } else {}
                  },
                  child: BlocBuilder<EcoattiviUserCubit, EcoattiviWrapper>(
                      builder: (context, model) {
                    return BlocBuilder<EcoattiviSituazioneutenteBloc,
                        EcoattiviSituazioneutenteState>(
                      builder: (context, state) {
                        if (state is ErrorEcoattiviSituazioneUtenteState) {
                          return Text('Error');
                        }
                        if (state is FetchedEcoattiviSituazioneUtenteState) {
                          context
                              .read<EcoattiviUserCubit>()
                              .setSituazioneUtente(state.situazioneUtente);
                          context
                              .read<EcoattiviUserCubit>()
                              .setToken(token ?? '');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
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
                                      Expanded(
                                        child: Text(
                                          'Ciao, ${(user.nome ?? user.mailAddress)} ${user.cognome ?? ''}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                      'Guadagna ecopunti e partecipa ai concorsi',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
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
                                      GestureDetector(
                                          child: Text(
                                            'Termini e regolamento',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                          onTap: () {
                                            context
                                                .read<RequestInfoBloc>()
                                                .getInfo(
                                                    Provider.of<BaseUrlNotifier>(
                                                            context,
                                                            listen: false)
                                                        .baseUrl,
                                                    'termini');
                                            showDialog(
                                              context: context,
                                              builder:
                                                  (BuildContext altcontext) {
                                                return BlocProvider.value(
                                                  value: context.read<
                                                      RequestInfoBloc>(), // Rende accessibile il bloc
                                                  child: BlocBuilder<
                                                      RequestInfoBloc,
                                                      RequestInfoState>(
                                                    builder: (context, state) {
                                                      if (state
                                                          is FetchedInfoState) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              "Termini e condizioni"),
                                                          content:
                                                              SingleChildScrollView(
                                                            child: MunicipiumUtility
                                                                .buildRichText(state
                                                                    .description),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              child: const Text(
                                                                  "Chiudi"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Chiudi il dialog
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      } else {
                                                        return const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          })
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
                                      GestureDetector(
                                          child: Text(
                                            'Privacy policy e regolamento',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                          onTap: () {
                                            context
                                                .read<RequestInfoBloc>()
                                                .getInfo(
                                                    Provider.of<BaseUrlNotifier>(
                                                            context,
                                                            listen: false)
                                                        .baseUrl,
                                                    'privacy');
                                            showDialog(
                                              context: context,
                                              builder:
                                                  (BuildContext altcontext) {
                                                return BlocProvider.value(
                                                  value: context.read<
                                                      RequestInfoBloc>(), // Rende accessibile il bloc
                                                  child: BlocBuilder<
                                                      RequestInfoBloc,
                                                      RequestInfoState>(
                                                    builder: (context, state) {
                                                      if (state
                                                          is FetchedInfoState) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              "Privacy policy e regolamento"),
                                                          content:
                                                              SingleChildScrollView(
                                                            child: MunicipiumUtility
                                                                .buildRichText(state
                                                                    .description),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              child: const Text(
                                                                  "Chiudi"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Chiudi il dialog
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      } else {
                                                        return const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          })
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildImageButton(
                                          "assets/images/ecoattivi_premi_home.png",
                                          "Premi"),
                                      GestureDetector(
                                        child: _buildImageButton(
                                            "assets/images/ecoattivi_location_home.png",
                                            "Ecomappa"),
                                        onTap: () => context.pushRoute(
                                            EcostopSection(token: token ?? '')),
                                      ),
                                      _buildImageButton(
                                          "assets/images/ecoattivi_ranking_home.png",
                                          "Ranking"),
                                      GestureDetector(
                                        onTap: () => context.pushRoute(
                                            EcoMessageRoute(
                                                token: token ?? '')),
                                        child: _buildImageButtonWithBadge(
                                          "assets/images/ecoattivi_message_home.png",
                                          "Messaggi",
                                          model.situazioneUtente!.msgNonLetti,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        child: GestureDetector(
                                          onTap: () => context.pushRoute(
                                              EcopointGridRoute(
                                                  token: token!,
                                                  situazioneUtente:
                                                      state.situazioneUtente)),
                                          child: const Text(
                                            'Vedi tutti',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                        Ecocard(
                                            body: EcocardBody(
                                          imagePath:
                                              'assets/images/ecoattivi_quiz_home.png', // Percorso dell'immagine
                                          title: 'Quiz',
                                          badgeCount: model.situazioneUtente!
                                                  .quizDaFare ??
                                              -1,
                                          onPressed: () {
                                            context.pushRoute(
                                                QuizListEcoattiviRoute(
                                                    token: model.token ?? ''));
                                            // Azione per il quiz
                                          },
                                        )),
                                        const SizedBox(width: 16),
                                        Ecocard(
                                            body: EcocardBody(
                                          imagePath:
                                              'assets/images/ecoattivi_qr_home.png', // Percorso immagine
                                          title: 'QR Code',
                                          badgeCount: 0,
                                          onPressed: () {
                                            context.pushRoute(
                                                QrEcoattiviRoute(token: token));
                                            // Azione per Invita un amico
                                          },
                                        )),
                                        const SizedBox(width: 16),
                                        Ecocard(
                                          body: EcocardBody(
                                            imagePath:
                                                'assets/images/ecoattivi_invite_friend_home.png', // Percorso immagine
                                            title: 'Invita un amico',
                                            badgeCount: 0,
                                            onPressed: () {
                                              context.pushRoute(InviteFriendRoute(
                                                  code: state.situazioneUtente
                                                          .codiceAmico ??
                                                      '',
                                                  punti: state.situazioneUtente
                                                          .puntiInvitaAmico ??
                                                      100));
                                              // Azione per Invita un amico
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Ecocard(
                                          body: EcocardBody(
                                            imagePath:
                                                'assets/images/ecoattivi_photo_home.png', // Percorso immagine
                                            title: 'Carica foto',
                                            badgeCount: 0,
                                            onPressed: () {
                                              context.pushRoute(EcoPhotoSection(
                                                  token: model.token ?? ''));
                                              // Azione per Invita un amico
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Ecocard(
                                            body: EcocardBody(
                                          imagePath:
                                              'assets/images/ecoattivi_missions_home.png', // Percorso immagine
                                          title: 'Missioni',
                                          badgeCount: model.situazioneUtente!
                                                  .missioniDaFare ??
                                              -1,
                                          onPressed: () {
                                            // Azione per Invita un amico
                                          },
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                  }),
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
          )),
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
      String imagePath, String label, int? badgeCount) {
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
                '${badgeCount ?? ''}',
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
}
