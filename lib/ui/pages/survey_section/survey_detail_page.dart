import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/survey_bloc/survey_detail_bloc/survey_detail_bloc.dart';
import 'package:municipium/ui/components/survey/question_result_cart.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SurveyDetailPage extends StatefulWidget implements AutoRouteWrapper {
  const SurveyDetailPage({super.key, required this.id});

  final int id;

  @override
  State<SurveyDetailPage> createState() => _SurveyDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SurveyDetailBloc(
                surveyRepository: context.read())
              ..fetchSurveyDetail(
                  Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl,
                  id),
          ),
        ],
        child: this,
      );
}

class _SurveyDetailPageState extends State<SurveyDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _totalPages = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyDetailBloc, SurveyDetailState>(
      builder: (context, state) {
        if (state is FetchedSurveyDetailState) {
          _totalPages = state.surveyDetail.results.length;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state.surveyDetail.title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _totalPages,
                    itemBuilder: (context, index) {
                      final result = state.surveyDetail.results[index];
                      return QuestionResultCard(result: result);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage > 0)
                        ElevatedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text('Indietro'),
                        )
                      else
                        const SizedBox(
                            width: 80), // Placeholder per allineamento
                      if (_currentPage < _totalPages - 1)
                        ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text('Avanti'),
                        )
                      else
                        ElevatedButton(
                          onPressed: () {
                            context.maybePop();
                            //context.router.pop(); // Chiude il sondaggio
                          },
                          child: const Text('Fine'),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        } else if (state is FetchingSurveyDetailState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
