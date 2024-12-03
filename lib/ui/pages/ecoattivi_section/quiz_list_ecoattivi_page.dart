import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/ecoattivi_quiz_bloc/ecoattivi_quiz_bloc.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class QuizListEcoattiviPage extends StatelessWidget
    implements AutoRouteWrapper {
  final String token;

  const QuizListEcoattiviPage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: Container(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<EcoattiviQuizBloc>(
          create: (context) => EcoattiviQuizBloc(
              ecoattiviRepository: context.read())
            ..fetchQuizList(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl,
                token,
                Provider.of<BaseUrlNotifier>(context, listen: false)
                    .guidEcoattivi),
        )
      ], child: this);
}
