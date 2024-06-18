import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/ui/components/buttons/rounded_shape_button.dart';
import 'package:municipium/ui/components/progress_pager_stepper.dart';
import 'package:municipium/ui/pages/issues_section/newissue_category_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_gallery_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_message_section.dart';
import 'package:municipium/ui/pages/issues_section/newissue_recap_section.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            ((model.email ?? '').isNotEmpty &&
                MunicipiumUtility.isValidEmail(model.email ?? '')) &&
            ((model.phone ?? '').isNotEmpty) &&
            ((model.address ?? '').isNotEmpty) &&
            ((model.content ?? '').isNotEmpty);
      case 2: //pagina galleria
        return model.noPhoto! || (model.imageList ?? []).isNotEmpty;
      case 3:
        return model.privacy ?? false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    totalPage = pages.length;
    final issueCubit = context.read<IssueCubit>();

    return Scaffold(
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
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.new_issue.toUpperCase(),
                          style: const TextStyle(
                              color: ThemeHelper.lightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.4),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          getTitle(context, stateIssue.currentPage!),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ProgressPagerStepper(
                        totalPage: totalPage,
                        currentPage: stateIssue.currentPage!),
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
                                  child: RoundedShapeButton(
                                      title: AppLocalizations.of(context)!
                                          .back_desc,
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
                                title: stateIssue.currentPage! != totalPage - 1
                                    ? AppLocalizations.of(context)!.next_desc
                                    : AppLocalizations.of(context)!.send_desc,
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
    );
  }

  String getTitle(BuildContext context, int currentPage) {
    switch (currentPage) {
      case 0:
        return AppLocalizations.of(context)!.issue_type;
      case 1:
        return AppLocalizations.of(context)!.issue_data;
      case 2:
        return AppLocalizations.of(context)!.issue_photo;
      case 3:
        return AppLocalizations.of(context)!.issue_recap;
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
