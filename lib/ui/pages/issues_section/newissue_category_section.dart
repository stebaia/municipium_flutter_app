import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_state.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/theme_helper.dart';

class NewIssueCategorySection extends StatelessWidget {
  const NewIssueCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final issueCubit = context.read<IssueCubit>();
    final fetchedTags =
        context.read<IssueTagBloc>().state as FetchedIssueTagState;
    IssueMappedCategory? selected;

    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique. '),
                const SizedBox(
                  height: 32,
                ),
                const Row(
                  children: [
                    Text(
                      'TIPO SEGNALAZIONE',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: ThemeHelper.lightGrey),
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton<String>(
                    underline: Container(),
                    hint: const Text(
                      'Seleziona una voce',
                      style: TextStyle(color: ThemeHelper.lightGrey),
                    ),
                    isExpanded: true,
                    menuMaxHeight: 300,
                    value: state.issueCategoryId != null
                        ? fetchedTags.issueMappedList
                            .where((e) => e.id == state.issueCategoryId)
                            .first
                            .name
                        : null, // Valore attualmente selezionato
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        context.read<IssueCubit>().setCategory(fetchedTags
                            .issueMappedList
                            .where((e) => e.name == newValue)
                            .first
                            .id);
                      }
                    },
                    items: fetchedTags.issueMappedList
                        .map((e) => e.name)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value), // Testo dell'opzione
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                fetchedTags.issueMappedList
                        .where((e) => e.id == state.issueCategoryId)
                        .first
                        .description
                        .isNotEmpty
                    ? Row(
                        children: [
                          Text(fetchedTags.issueMappedList
                              .where((e) => e.id == state.issueCategoryId)
                              .first
                              .description),
                          const SizedBox()
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}
