import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/ui/pages/issues_section/newissue_category_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_gallery_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_message_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_recap_section.dart';
import 'package:municipium/utils/theme_helper.dart';

@RoutePage()
class NewIssuePager extends StatefulWidget implements AutoRouteWrapper {
  const NewIssuePager({super.key});

  @override
  State<NewIssuePager> createState() => _NewIssuePagerState();

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

class _NewIssuePagerState extends State<NewIssuePager> {
  int currentPage = 0;

  final List<Widget> pages = [
    NewIssueCategorySection(),
    NewIssueMessageSection(),
    NewIssueGallerySection(),
    NewIssueRecapSection()
  ];
  int totalPage = 0;
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    totalPage = pages.length;

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
      body: BlocBuilder<IssueTagBloc, IssueTagState>(
        builder: (context, state) {
          if (state is FetchedIssueTagState) {
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
                      getTitle(),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          totalPage,
                          (index) {
                            bool isColored = index <=
                                currentPage; //lo uso per tenere colorati i tratti precedenti
                            return Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  height: 5,
                                  width: (MediaQuery.of(context).size.width -
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
                            'Step ${currentPage + 1} di $totalPage',
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
                  child: Container(
                    child: BlocProvider(
                      create: (context) => IssueCubit(),
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageController,
                          itemCount: pages.length,
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          itemBuilder: ((context, index) {
                            return pages[index];
                          })),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      currentPage != 0
                          ? GestureDetector(
                              onTap: (() {
                                pageController.previousPage(
                                  duration: const Duration(
                                      milliseconds:
                                          500), // Durata dell'animazione
                                  curve: Curves.ease, // Curva dell'animazione
                                );
                              }),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 32),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: ThemeHelper.blueMunicipium),
                                ),
                                child: const Text(
                                  'Indietro',
                                  style: TextStyle(
                                      color: ThemeHelper.blueMunicipium),
                                ),
                              ),
                            )
                          : Container(),
                      const SizedBox(),
                      GestureDetector(
                        onTap: (() {
                          pageController.nextPage(
                            duration: const Duration(
                                milliseconds: 500), // Durata dell'animazione
                            curve: Curves.ease, // Curva dell'animazione
                          );
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ThemeHelper.blueMunicipium),
                          child: const Text(
                            'Avanti',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            );
          } else {
            //TODO: controllo sul fetching
            return Container();
          }
        },
      ),
    ));
  }

  String getTitle() {
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
}
