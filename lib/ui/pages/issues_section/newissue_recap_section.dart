import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/theme_helper.dart';

class NewIssueRecapSection extends StatelessWidget {
  const NewIssueRecapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchedTags =
        context.read<IssueTagBloc>().state as FetchedIssueTagState;

    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        IssueMappedCategory category = fetchedTags.getFromIssueCategoryId(
            (state.issueSubCategoryId! > 0
                ? state.issueSubCategoryId
                : state.issueCategoryId!))!;
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 248, 253, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Dati seganalazione',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Row(
                      children: [
                        Text(
                          'TIPOLOGIA SEGNALAZIONE',
                          style: TextStyle(
                              color: ThemeHelper.lightGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          category.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          'NOME E COGNOME',
                          style: TextStyle(
                              color: ThemeHelper.lightGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          state.name ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          'TELEFONO',
                          style: TextStyle(
                              color: ThemeHelper.lightGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          state.phone ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          'INDIRIZZO SEGNALAZIONE',
                          style: TextStyle(
                              color: ThemeHelper.lightGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          state.address ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          'MESSAGGIO',
                          style: TextStyle(
                              color: ThemeHelper.lightGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          state.content ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17),
                        ),
                        const SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
              (state.imageList ?? []).length > 0 ? Container() : Container()
            ],
          ),
        );
      },
    );
  }
}
