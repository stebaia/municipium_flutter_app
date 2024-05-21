import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewIssueCategorySection extends StatelessWidget {
  NewIssueCategorySection({super.key});
  //BuildContext mContext;
  @override
  Widget build(BuildContext context) {
    final fetchedTags =
        context.read<IssueTagBloc>().state as FetchedIssueTagState;
    //List<IssueMappedCategory> subList = [];

    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit adipiscing sit enim enim id iaculis tristique. ',
                  style: TextStyle(letterSpacing: -0.4),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.issue_type,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: -0.4),
                    ),
                    const SizedBox()
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
                    hint: Text(
                      AppLocalizations.of(context)!.choose_voice,
                      style: const TextStyle(
                          color: ThemeHelper.lightGrey, letterSpacing: -0.4),
                    ),
                    isExpanded: true,
                    menuMaxHeight: 300,
                    value: state.issueCategoryId != null
                        ? fetchedTags
                            .getFromIssueCategoryId(state.issueCategoryId)
                            ?.name
                        : null, // Valore attualmente selezionato
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        final model = fetchedTags.getFromName(newValue);
                        context
                            .read<IssueCubit>()
                            .setSubCategory(-1); //resetto la subcategory
                        if (model != null) {
                          context.read<IssueCubit>().setCategory(model.id);
                          context
                              .read<IssueCubit>()
                              .setSubList(fetchedTags.getFromTag(model.id));
                        }
                      }
                    },
                    items: fetchedTags.issueMappedList
                        .map((e) => e.name)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(letterSpacing: -0.4),
                        ), // Testo dell'opzione
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                (fetchedTags.getFromIssueCategoryId(state.issueCategoryId) !=
                            null &&
                        fetchedTags
                            .getFromIssueCategoryId(state.issueCategoryId)!
                            .description
                            .isNotEmpty)
                    ? Row(
                        children: [
                          Text(
                              fetchedTags
                                  .getFromIssueCategoryId(
                                      state.issueCategoryId)!
                                  .description,
                              style: const TextStyle(letterSpacing: -0.4)),
                          const SizedBox()
                        ],
                      )
                    : Container(),
                const SizedBox(height: 16),
                (state.subList!.isNotEmpty)
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: ThemeHelper.lightGrey),
                            borderRadius: BorderRadius.circular(8)),
                        child: DropdownButton<String>(
                          underline: Container(),
                          hint: Text(
                            AppLocalizations.of(context)!.choose_voice,
                            style: const TextStyle(
                                color: ThemeHelper.lightGrey,
                                letterSpacing: -0.4),
                          ),
                          isExpanded: true,
                          menuMaxHeight: 300,
                          value: state.issueSubCategoryId != null &&
                                  state.subList!
                                      .where((element) =>
                                          element.id ==
                                          state.issueSubCategoryId)
                                      .isNotEmpty
                              ? state.subList!
                                  .firstWhere((element) =>
                                      element.id == state.issueSubCategoryId)
                                  .name
                              : null, // Valore attualmente selezionato
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              final IssueMappedCategory model = state.subList!
                                  .firstWhere(
                                      (element) => element.name == newValue);
                              context
                                  .read<IssueCubit>()
                                  .setSubCategory(model.id);
                            }
                          },
                          items: state.subList!
                              .map((e) => e.name)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(letterSpacing: -0.4),
                              ), // Testo dell'opzione
                            );
                          }).toList(),
                        ))
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}
