import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:municipium/bloc/bloc/ecoattivi_quiz_detail_bloc/ecoattivi_quiz_detail_bloc.dart';
import 'package:municipium/bloc/cubit/ecoattivi_pager_cubit/ecoattivi_pager_cubit.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_question.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_quiz_detail.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_user_answer.dart';
import 'package:municipium/model/ecoattivi/progress_quiz.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/ecoattivi/ecoattivi_painter_bkg.dart';
import 'package:municipium/ui/components/ecoattivi/question_widget.dart';
import 'package:municipium/ui/pages/ecoattivi_section/quiz_list_ecoattivi_page.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EcoattiviQuizPager extends StatelessWidget implements AutoRouteWrapper {
  final int quizId;
  final String token;
  final PageController _pageController = PageController();
  EcoattiviQuizPager({super.key, required this.quizId, required this.token});

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<EcoattiviPagerCubit>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
                context.replaceRoute(QuizListEcoattiviRoute(token: token)),
          ),
        ),
        body: BlocBuilder<EcoattiviQuizDetailBloc, EcoattiviQuizDetailState>(
          builder: (context, state) {
            if (state is ErrorEcoattiviQuizDetailState ||
                state is NoEcoattiviQuizDetailState) {
              return Text('error');
            }
            if (state is FetchedEcoattiviQuizDetailState) {
              List<QuestionWidget> pages = generatePages(
                  state.quizDetail, quizCubit, _pageController, context);

              quizCubit.setTotQuestions(state.quizDetail.domande!.length);
              quizCubit.setTotalPoints(state.quizDetail.domande!.length *
                  (state.quizDetail.puntiDomanda ?? 0));
              quizCubit
                  .addRisposteUtente(state.quizDetail.risposteUtente ?? []);
              List<EcoattiviQuestion> rightQuestions =
                  checkRightAnswers(state.quizDetail.domande!, quizCubit);
              List<EcoattiviQuestion> questionsToDo =
                  getQuestionToDo(state.quizDetail);
              if (questionsToDo.isNotEmpty) {
                quizCubit.setCurrentQuestion(questionsToDo[0].progressivo ?? 0);
              } else {
                quizCubit.setCurrentQuestion(state.quizDetail.domande!.length);
              }

              quizCubit.setCurrentPoints(
                  rightQuestions.length * (state.quizDetail.puntiDomanda ?? 0));
              pages.add(QuestionWidget(
                  question: null,
                  buttonColors: {},
                  child: getOnCompleteWidget(
                      context,
                      quizCubit,
                      (state.quizDetail.puntiDomanda ?? 0) *
                          rightQuestions.length,
                      rightQuestions.length,
                      state.quizDetail.domande!.length)));
              return BlocBuilder<EcoattiviPagerCubit, ProgressQuiz>(
                  builder: (context, progressQuiz) {
                bool isCompletedPage =
                    ((progressQuiz.risposteUtente ?? []).length ==
                        (state.quizDetail.domande ?? []).length);
                return Container(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        isCompletedPage
                            ? Container()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Domanda ${(progressQuiz.currentQuestion ?? 0)}/${progressQuiz.totQuestions ?? 0}'),
                                  const SizedBox(),
                                  Text(
                                      '${progressQuiz.currentPoints ?? 0}/${progressQuiz.totalPoints ?? 0}')
                                ],
                              ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.85,
                          ),
                          child: PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _pageController,
                              itemCount: pages.length,
                              onPageChanged: (value) async {
                                List<EcoattiviQuestion> domandeDaSvolgere =
                                    getQuestionToDo(state.quizDetail);

                                List<EcoattiviQuestion> rightQuestions =
                                    checkRightAnswers(
                                        state.quizDetail.domande!, quizCubit);
                                if (value != domandeDaSvolgere.length) {
                                  quizCubit.setCurrentQuestion(
                                      domandeDaSvolgere[value].progressivo ??
                                          0);
                                  quizCubit.setCurrentPoints(
                                      rightQuestions.length *
                                          (state.quizDetail.puntiDomanda ?? 0));
                                }
                                bool res = await quizCubit.updateQuiz(
                                    Provider.of<BaseUrlNotifier>(context,
                                            listen: false)
                                        .baseUrlEcoattivi,
                                    token,
                                    Provider.of<BaseUrlNotifier>(context,
                                            listen: false)
                                        .guidEcoattivi,
                                    quizId,
                                    false);
                              },
                              itemBuilder: ((context, index) {
                                return pages[index];
                              })),
                        ),
                      ],
                    ),
                  ),
                );
              });
            }
            return Lottie.asset('assets/lottie/ecoattivi_loading.json',
                width: 160, height: 160);
          },
        ));
  }

  Widget getOnCompleteWidget(
      BuildContext context,
      EcoattiviPagerCubit quizCubit,
      int punti,
      int risposteEsatte,
      int totDomande) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Parte superiore con CustomPainter
          Container(
            width: screenWidth,
            height: screenHeight * 0.35, // Regola l'altezza per adattarla
            child: CustomPaint(
              painter: BackgroundPainter(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hai guadagnato',
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Rispondendo esattamente a $risposteEsatte domande su $totDomande',
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
            child: const Column(
              children: [
                Text(
                  'Puoi fare di meglio? Rigioca! Se invece ssei soddisfatto del risultato raggiunto, acquisisci i punti guadagnati',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeHelper.blueMunicipium, // Colore del bordo
                      width: 2, // Larghezza del bordo
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                width: MediaQuery.of(context).size.width *
                    0.4, // 40% della larghezza dello schermo
                child: TextButton(
                  onPressed: () async {
                    bool res = await quizCubit.updateQuiz(
                        Provider.of<BaseUrlNotifier>(context, listen: false)
                            .baseUrlEcoattivi,
                        token,
                        Provider.of<BaseUrlNotifier>(context, listen: false)
                            .guidEcoattivi,
                        quizId,
                        false,
                        reset: true);
                    if (res) {
                      context.replaceRoute(
                          EcoattiviQuizRouter(quizId: quizId, token: token));
                    }
                  },
                  child: const Text(
                    'Rigioca',
                    style: TextStyle(
                        fontSize: 18, color: ThemeHelper.blueMunicipium),
                  ),
                ),
              ),
              const SizedBox(width: 16), // Spazio fisso tra i pulsanti
              Container(
                decoration: const BoxDecoration(
                    color: ThemeHelper.blueMunicipium,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                width: MediaQuery.of(context).size.width *
                    0.4, // 40% della larghezza dello schermo
                child: TextButton(
                  onPressed: () async {
                    bool res = await quizCubit.updateQuiz(
                        Provider.of<BaseUrlNotifier>(context, listen: false)
                            .baseUrlEcoattivi,
                        token,
                        Provider.of<BaseUrlNotifier>(context, listen: false)
                            .guidEcoattivi,
                        quizId,
                        true);
                    if (res) {
                      context
                          .replaceRoute(QuizListEcoattiviRoute(token: token));
                    }
                  },
                  child: const Text(
                    'Acquisisci punti',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<QuestionWidget> generatePages(
      EcoattiviQuizDetail detail,
      EcoattiviPagerCubit cubit,
      PageController controller,
      BuildContext context) {
    List<EcoattiviQuestion> questions = (detail.domande ?? []);
    questions.sort((a, b) {
      return (a.progressivo ?? 0).compareTo(b.progressivo ?? 0);
    });

    List<QuestionWidget> list = [];
    List<EcoattiviQuestion> domandeDaSvolgere = getQuestionToDo(detail);

    for (var question in domandeDaSvolgere) {
      final buttonColors = cubit.getButtonColors(question.domandaId!);
      QuestionWidget widget = QuestionWidget(
        question: question,
        buttonColors: buttonColors ?? {},
        onPressed: (id) {
          final correctAnswerId = question.risposte
              ?.firstWhere((answer) => answer.rispostaEsatta == true)
              .rispostaId;

          // Aggiorna il colore della risposta selezionata
          final color = id == correctAnswerId ? Colors.green : Colors.red;
          cubit.updateButtonColor(question.domandaId!, id, color);

          // Aggiunge la risposta selezionata
          cubit.addRispostaUtente(
            EcoattiviUserAnswer(
              domandaId: question.domandaId,
              rispostaId: id,
            ),
          );

          // Passa alla prossima pagina
          if (controller.hasClients &&
              controller.page != null &&
              controller.page! < questions.length - 1) {
            Future.delayed(const Duration(milliseconds: 500), () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          }
        },
      );
      list.add(widget);
    }
    return list;
  }

  List<EcoattiviQuestion> getQuestionToDo(EcoattiviQuizDetail detail) {
    List<EcoattiviQuestion> domandeDaSvolgere =
        detail.domande!.where((question) {
      return !(detail.risposteUtente
              ?.map((answer) => answer.domandaId)
              .contains(question.domandaId) ??
          false);
    }).toList();
    return domandeDaSvolgere;
  }

  List<EcoattiviQuestion> checkRightAnswers(
      List<EcoattiviQuestion> questions, EcoattiviPagerCubit cubit) {
    List<EcoattiviQuestion> domande = questions.where((question) {
      // Filtra le domande che corrispondono agli ID delle risposte utente
      return cubit.state.risposteUtente
              ?.map((answer) => answer.domandaId)
              .contains(question.domandaId) ??
          false;
    }).where((question) {
      // Filtra ulteriormente le domande in base alla corrispondenza con le risposte corrette
      return cubit.state.risposteUtente!.where((answer) {
        return question.domandaId == answer.domandaId &&
            question.risposte!
                    .where((risp) => risp.rispostaEsatta == true)
                    .map((answerEco) => answerEco.rispostaId)
                    .first ==
                answer.rispostaId;
      }).isNotEmpty;
    }).toList();
    return domande;
// Calcola i punti guadagnati e le risposte esatte
    //int puntiGuadagnati = domande.length * detail.puntiDomanda!;
    //int risposteEsatte = domande.length;
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<EcoattiviQuizDetailBloc>(
            create: (context) =>
                EcoattiviQuizDetailBloc(ecoattiviRepository: context.read())
                  ..fetchQuizDetail(
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .baseUrlEcoattivi,
                      quizId,
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .guidEcoattivi,
                      token),
          ),
          BlocProvider<EcoattiviPagerCubit>(
            create: (context) =>
                EcoattiviPagerCubit(ecoattiviRepository: context.read()),
          )
        ],
        child: this,
      );
}
