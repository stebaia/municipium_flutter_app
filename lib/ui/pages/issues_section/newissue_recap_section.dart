import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/issue_mapped_category.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/component_factory.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';

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
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.4),
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
                    const Row(
                      children: [
                        Text(
                          'NOME E COGNOME',
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
                          state.name ?? '',
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
                          'TELEFONO',
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
                    const Row(
                      children: [
                        Text(
                          'INDIRIZZO SEGNALAZIONE',
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
                    const Row(
                      children: [
                        Text(
                          'MESSAGGIO',
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
              const SizedBox(
                height: 32,
              ),
              (state.imageList ?? []).isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 248, 253, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: ComponentFactory.createGalleryHorizzontalList(
                        state.imageList!,
                        title: const Row(
                          children: [
                            Text(
                              'Foto segnalazione',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.4),
                            ),
                            SizedBox()
                          ],
                        ),
                      ),
                    )
                  : Container(),
              ComponentFactory.createCheckbox(
                state.privacy ?? false,
                const Text('Accettazione informativa sui dati personali',
                    style: TextStyle(
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
              const Text(
                'Procedendo con la compilazione e con l\'invio di questo modulo Lei acconsente al trattamento dei dati personali forniti, ai sensi e per gli effetti dell\'articolo 13 del Regolamento EU 2016/679 e della normativa nazionale applicabile in materia di trattamento dei dati personali, per la finalità e nei limiti indicati dall\'informativa sulla privacy che la invitiamo a leggere con attenzione.',
                style: TextStyle(
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
                      text: 'Leggi l\'informativa',
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
