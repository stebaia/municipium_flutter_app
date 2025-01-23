import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/ecoattivi_quiz_bloc/ecoattivi_quiz_bloc.dart';
import 'package:municipium/bloc/cubit/tab_cubit.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/ecoattivi/ecopoints_label.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:provider/provider.dart';

@RoutePage()
class QuizListEcoattiviPage extends StatelessWidget
    implements AutoRouteWrapper {
  final String token;

  const QuizListEcoattiviPage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    TabCubit tabCubit = context.read<TabCubit>();
    return BlocBuilder<TabCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.maybePop(),
            ),
          ),
          body: BlocBuilder<EcoattiviQuizBloc, EcoattiviQuizState>(
            builder: (context, state) {
              if (state is ErrorEcoattiviQuizListState) {
                return Text('Error');
              }
              if (state is FetchedEcoattiviQuizListState) {
                context
                    .read<EcoattiviQuizBloc>()
                    .filterQuizList(tabCubit.state == 0);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.quizList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: tabCubit.state == 0
                              ? () {
                                  context.router.replace(EcoattiviQuizRouter(
                                      quizId: state.quizList[index].quizId ?? 0,
                                      token: token));
                                }
                              : null,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.quizList[index].titolo ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(tabCubit.state == 0
                                        ? '${state.quizList[index].numTotDomande ?? ''} domande'
                                        : '${state.quizList[index].giuste ?? ''} risposte esatte su ${state.quizList[index].numTotDomande ?? ''}'),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                EcopointsLabel(
                                    showArrow: tabCubit.state == 0,
                                    punti: tabCubit.state == 0
                                        ? state.quizList[index].puntiMax ?? 0
                                        : state.quizList[index]
                                                .puntiGuadagnati ??
                                            0)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: const Divider(thickness: 0.4),
                        ),
                      ],
                    );
                  },
                );
              }
              return ShimmerUtils.buildPoiShimmer(9);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ToggleButtons(
                borderColor: Colors.transparent,
                fillColor: ThemeHelper.blueMunicipium,
                borderWidth: 0,
                selectedBorderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                selectedColor: Colors.white,
                color: Colors.black,
                isSelected: [state == 0, state == 1],
                onPressed: (index) {
                  // Aggiorna il Cubit del Tab
                  context.read<TabCubit>().selectTab(index);

                  // Chiama il metodo filterQuizList in base all'indice
                  if (index == 0) {
                    context.read<EcoattiviQuizBloc>().filterQuizList(true);
                  } else {
                    context.read<EcoattiviQuizBloc>().filterQuizList(false);
                  }
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(width: 60, child: Text('Nuovi')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(width: 60, child: Text('Passati')),
                  ),
                ],
              )),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<EcoattiviQuizBloc>(
            create: (context) =>
                EcoattiviQuizBloc(ecoattiviRepository: context.read())
                  ..fetchQuizList(
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .baseUrlEcoattivi,
                      token,
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .guidEcoattivi),
          ),
          BlocProvider<TabCubit>(
            create: (context) => TabCubit(),
          ),
        ],
        child: this,
      );
}
