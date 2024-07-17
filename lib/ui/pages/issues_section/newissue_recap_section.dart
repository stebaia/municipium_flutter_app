import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/ui/components/horizzontal_gallery.dart';
import 'package:municipium/utils/component_factory.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewIssueRecapSection extends StatelessWidget {
  const NewIssueRecapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = (context.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    final fetchedTags =
        context.read<IssueTagBloc>().state as FetchedIssueTagState;

    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        IssueMappedCategory category = state.issueSubCategoryId! > 0
            ? state.subList!
                .where((element) => element.id == state.issueSubCategoryId)
                .first
            : fetchedTags.getFromIssueCategoryId(state.issueCategoryId!)!;
        return SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      //color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .issue_data
                                .toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .issue_type
                                .toUpperCase(),
                            style: const TextStyle(
                                color: ThemeHelper.darkGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
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
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.name_desc.toUpperCase()} e ${AppLocalizations.of(context)!.surname_desc.toUpperCase()}',
                            style: const TextStyle(
                                color: ThemeHelper.darkGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            '${(state.name ?? '')} ${(state.surname ?? '')}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: -0.4),
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
                            'EMAIL',
                            style: TextStyle(
                                color: ThemeHelper.darkGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.4),
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
                            state.email ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .phone_desc
                                .toUpperCase(),
                            style: const TextStyle(
                                color: ThemeHelper.darkGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
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
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .address_desc
                                .toUpperCase(),
                            style: const TextStyle(
                                color: ThemeHelper.darkGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
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
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.content_desc,
                              style: const TextStyle(
                                  color: ThemeHelper.darkGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  letterSpacing: -0.4),
                            ),
                          ),
                          const SizedBox()
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
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              (state.imageList ?? []).isNotEmpty
                  ? Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: HorizzontalGallery(
                          imageList: state.imageList!,
                          title: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.issue_photo,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.4),
                              ),
                              const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              ComponentFactory.createCheckbox(
                state.privacy ?? false,
                Text(AppLocalizations.of(context)!.accept_privacy,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.4)),
                onChanged: (value) {
                  context.read<IssueCubit>().setPrivacy(value ?? false);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context)!.privacy_desc,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.4),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.read_privacy,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: ThemeHelper.blueMunicipium,
                          decoration: TextDecoration.underline,
                          letterSpacing: -0.4),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          MunicipiumUtility.launch(
                              'https://${municipality.subdomain}/admin/municipalities/${municipality.muninicipalityId}/privacy_policy_app');
                        },
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
