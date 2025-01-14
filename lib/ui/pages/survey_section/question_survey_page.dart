import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/bloc/bloc/survey_bloc/survey_post_bloc/survey_post_bloc.dart';
import 'package:municipium/bloc/bloc/survey_bloc/survey_question_bloc/survey_question_bloc.dart';
import 'package:municipium/bloc/cubit/device_cubit/device_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/survey/question_response.dart';
import 'package:municipium/model/survey/survey_post_request.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class QuestionSurveyPage extends StatefulWidget implements AutoRouteWrapper {
  final int id;

  const QuestionSurveyPage({Key? key, required this.id}) : super(key: key);

  @override
  _QuestionPagerState createState() => _QuestionPagerState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SurveyQuestionBloc(
                surveyRepository: context.read())
              ..fetchSurveyQuestions(
                  Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl,
                  id),
          ),
          BlocProvider(
              create: (context) =>
                  SurveyVoteBloc(surveyRepository: context.read())),
        ],
        child: this,
      );
}

class _QuestionPagerState extends State<QuestionSurveyPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Map<int, List<Answers>> _selectedAnswers = {};
  
  bool _isPrivacyAccepted = false; // Stato per la checkbox della privacy policy

  void _nextPage(int length, SurveyQuestionState state, String udid) {
    if (_currentPage < length - 2) {
      if (_currentPage > 0 && _currentPage < length - 2) {
        if (state is FetchedSurveyQuestionState) {
          if ((_selectedAnswers.containsKey(
              state.questionResponse.questions[_currentPage - 1].questionId))) {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      "Per favore, seleziona una risposta per ogni domanda")),
            );
          }
        }
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    } else {
      // Verifica se la privacy è stata accettata
      if (!_isPrivacyAccepted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Devi accettare la privacy policy per continuare")),
        );
        return;
      }

      // Costruisci la lista di risposte
      List<Answers> answersList = [];

      for (final  (index, entry)  in _selectedAnswers.entries.indexed) {
        int questionId = entry.key;
        //String answer = entry.value[index];
        
        answersList.add(Answers(
          questionId: questionId,
          answerIds: [int.parse(answer)], // Assumendo che sia un ID numerico
        ));
      }

     
      

      // Effettua la chiamata di post con i dati raccolti
      context.read<SurveyVoteBloc>().postSurveyVote(
            Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl,
            widget.id,
            SurveyPostRequest(
              answers: answersList,
              udid: udid, // Sostituire con il vero UDID se disponibile
              ended: true,
              isHeader: false,
              participants: 0,
              id: widget.id,
              visible: false,
              voted: true,
            ),
          );

      // Mostra conferma o naviga via
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Widget _buildQuestionWidget(Questions question) {
    switch (question.questionType) {
      case 'string':
      case 'string-multiline':
        return TextField(
          decoration: InputDecoration(
                  labelText: question.question,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      
                      width: 2,
                    ),
                  ),
                ),
          
          onChanged: (value) {
            setState(() {
              _selectedAnswers.putIfAbsent(question.questionId, () => []);
              _selectedAnswers[question.questionId]!.add(Answers(answer: value, type: question.questionType, questionId: question.questionId));
            });
          },
        );
      case 'checkbox':
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: question.answers!.map((answer) {
      return CheckboxListTile(
        title: Text(answer),
        value: _selectedAnswers[question.questionId]?.contains(answer) ?? false,
        onChanged: (value) {
          setState(() {
            if (value!) {
              // Aggiunge la risposta selezionata
              _selectedAnswers.putIfAbsent(question.questionId, () => []);
             // _selectedAnswers[question.questionId]!.add(Answers(answerIds: question.answers.indexOf(answer)));
            } else {
              // Rimuove la risposta deselezionata
              _selectedAnswers[question.questionId]?.remove(answer);
              // Se la lista è vuota, la rimuove del tutto
              if (_selectedAnswers[question.questionId]!.isEmpty) {
                _selectedAnswers.remove(question.questionId);
              }
            }
          });
        },
      );
    }).toList(),
  );
      case 'radiobox':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: question.answers!.map((answer) {
            return RadioListTile<String>(
              title: Text(answer),
              value: answer,
              groupValue: _selectedAnswers[question.questionId]![0],
              onChanged: (value) {
                setState(() {
                  _selectedAnswers.putIfAbsent(question.questionId, () => []);
                  _selectedAnswers[question.questionId]!.add(value!);
                  
                });
              },
            );
          }).toList(),
        );
      case 'number':
        return TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: question.question),
          onChanged: (value) {
            setState(() {
              _selectedAnswers.putIfAbsent(question.questionId, () => []);
              _selectedAnswers[question.questionId]!.add(value);
              
            });
          },
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final municipality = context.read<MunicipalityStoredCubit>().state;
    return BlocListener<SurveyVoteBloc, SurveyVoteState>(
      listener: (context, state) {
        if (state is PostedSurveyVoteState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.surveyPostResponse.message!),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<SurveyQuestionBloc, SurveyQuestionState>(
        builder: (context, state) {
          if (state is FetchedSurveyQuestionState) {
            // Aggiungi la pagina di inizio
            List<Widget> pages = [
              // Pagina di start con il messaggio
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Html(data: state.questionResponse.startMessage),
              ),

              ...state.questionResponse.questions.map(
                (question) {
                  // Pagine delle domande
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(question.question,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        _buildQuestionWidget(question),
                      ],
                    ),
                  );
                },
              ),
              // Pagina finale per la privacy policy
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                            AppLocalizations.of(context)!.accept_privacy,
                            style: const TextStyle(fontSize: 14)),
                        value: _isPrivacyAccepted,
                        onChanged: (bool? value) {
                          setState(() {
                            _isPrivacyAccepted = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(AppLocalizations.of(context)!.acceptation_body,
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 32),
                      InkWell(
                          onTap: () {
                            MunicipiumUtility.launch(
                                'https://${municipality!.subdomain}/admin/municipalities/${municipality.muninicipalityId}/privacy_policy_app');
                          },
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                  AppLocalizations.of(context)!.read_info,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Html(data: state.questionResponse.endMessage),
              ),
            ];

            return Scaffold(
              appBar: AppBar(
                  title: Text(
                state.questionResponse.title,
                style: const TextStyle(fontSize: 20),
              )),
              body: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) =>
                          setState(() => _currentPage = index),
                      itemCount: pages.length,
                      itemBuilder: (context, index) => pages[index],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _currentPage == 0
                            ? const SizedBox()
                            : ElevatedButton(
                                onPressed: _previousPage,
                                child: const Text('Indietro'),
                              ),
                        ElevatedButton(
                          onPressed: (_currentPage == 0 ||
                                      _currentPage == pages.length - 2) ||
                                  (_selectedAnswers.containsKey(state
                                      .questionResponse
                                      .questions[_currentPage - 1]
                                      .questionId))
                              ? () async {
                                  DeviceBe? deviceBe = await context
                                      .read<DeviceCubit>()
                                      .getDeviceBeFromStorage();
                                  if (deviceBe != null) {
                                    _nextPage(
                                        pages.length, state, deviceBe.udid);
                                  }
                                }
                              : null, // Disabilita il bottone se non tutte le risposte sono selezionate
                          child: Text(_currentPage == pages.length - 2
                              ? _currentPage == pages.length - 1
                                  ? 'Fine'
                                  : 'Concludi'
                              : 'Avanti'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          } else if (state is FetchingSurveyQuestionState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
