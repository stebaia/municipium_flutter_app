import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/ui/components/buttons/rounded_shape_button.dart';
import 'package:municipium/ui/pages/issues_section/newissue_category_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_gallery_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_message_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_recap_section.dart';
import 'package:municipium/utils/theme_helper.dart';

@RoutePage()
class NewIssuePager extends StatelessWidget implements AutoRouteWrapper {
  NewIssuePager({super.key});

  final List<Widget> pages = [
    NewIssueCategorySection(),
    NewIssueMessageSection(),
    NewIssueGallerySection(),
    NewIssueRecapSection()
  ];

  int totalPage = 0;

  bool checkRuleForStep(BuildContext context, ProgressIssue issue) {
    final model = context.watch<IssueCubit>().state;
    switch (issue.currentPage) {
      case 0: //pagina categoria
        if (model.issueCategoryId != null) {
          if ((model.subList!.isNotEmpty)) {
            return model.issueSubCategoryId != null &&
                model.issueSubCategoryId! > 0;
          } else {
            return true;
          }
        } else {
          return false;
        }
      case 1: //pagina messaggio e dati personali
        return ((model.name ?? '').isNotEmpty) &&
            ((model.email ?? '').isNotEmpty) &&
            ((model.phone ?? '').isNotEmpty) &&
            ((model.address ?? '').isNotEmpty) &&
            ((model.content ?? '').isNotEmpty);
      case 2: //pagina galleria
        return model.noPhoto!;
      case 3:
        return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    totalPage = pages.length;
    final issueCubit = context.read<IssueCubit>();
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        // Rimuovi il titolo
        title: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.maybePop();
              // Azione da eseguire quando il pulsante viene premuto
              // go to next page
            },
          ),
        ],
      ),
      body: BlocConsumer<IssueTagBloc, IssueTagState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FetchedIssueTagState) {
            return BlocBuilder<IssueCubit, ProgressIssue>(
              bloc: issueCubit,
              builder: (issueContext, stateIssue) {
                bool checkStep = checkRuleForStep(context, stateIssue);
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    const Row(
                      children: [
                        Text(
                          'NUOVA SEGNALAZIONE',
                          style: TextStyle(
                              color: ThemeHelper.lightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          getTitle(stateIssue.currentPage!),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              totalPage,
                              (index) {
                                bool isColored = index <=
                                    stateIssue
                                        .currentPage!; //lo uso per tenere colorati i tratti precedenti
                                return Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      height: 5,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  (32 + totalPage * 4)) /
                                              totalPage,
                                      decoration: BoxDecoration(
                                        color: isColored
                                            ? ThemeHelper.blueMunicipium
                                            : ThemeHelper.lightGrey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 4), // Spazio tra i container
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Step ${stateIssue.currentPage! + 1} di $totalPage',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageController,
                          itemCount: pages.length,
                          onPageChanged: (value) {
                            context.read<IssueCubit>().setCurrentPage(value);
                          },
                          itemBuilder: ((context, index) {
                            return pages[index];
                          })),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          stateIssue.currentPage != 0
                              ? TextButton(
                                  onPressed: (() {
                                    FocusScope.of(context).unfocus();
                                    pageController.previousPage(
                                      duration: const Duration(
                                          milliseconds:
                                              500), // Durata dell'animazione
                                      curve:
                                          Curves.ease, // Curva dell'animazione
                                    );
                                  }),
                                  child: const RoundedShapeButton(
                                      title: 'Indietro',
                                      color: ThemeHelper.blueMunicipium,
                                      textColor: Colors.white),
                                )
                              : Container(),
                          const SizedBox(),
                          TextButton(
                            onPressed: checkStep
                                ? (() {
                                    FocusScope.of(context).unfocus();
                                    pageController.nextPage(
                                      duration: const Duration(
                                          milliseconds:
                                              500), // Durata dell'animazione
                                      curve:
                                          Curves.ease, // Curva dell'animazione
                                    );
                                  })
                                : null,
                            child: RoundedShapeButton(
                                title: 'Avanti',
                                color: checkStep
                                    ? ThemeHelper.blueMunicipium
                                    : Colors.grey,
                                textColor: Colors.white),
                          )
                        ],
                      ),
                    )
                  ]),
                );
              },
            );
          } else {
            //TODO: controllo sul fetching
            return Container();
          }
        },
      ),
    ));
  }

  String getTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'Tipo segnalazione';
      case 1:
        return 'Dati segnalazione';
      case 2:
        return 'Foto segnalazione';
      case 3:
        return 'Riepilogo';
      default:
        return '';
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<IssueTagBloc>(
          create: (context) => IssueTagBloc(issuesRepository: context.read())
            ..fetchIssueTagsCategories(),
        ),
        BlocProvider<IssueCubit>(
          create: (context) => IssueCubit(),
        )
      ], child: this);
}
