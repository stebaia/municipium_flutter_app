import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/bloc/geolocation_bloc/geolocation_bloc_bloc.dart';
import 'package:municipium/bloc/bloc/issue_tags_bloc/issue_tag_bloc.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/component_factory.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewIssueMessageSection extends StatelessWidget {
  const NewIssueMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchedTags =
        context.read<IssueTagBloc>().state as FetchedIssueTagState;
    var positionBloc = context.read<GeolocationBloc>().state;
    return BlocListener<GeolocationBloc, GeolocationState>(
      listener: (context, geoState) async {
        if (geoState is GeolocationSuccessState) {
          try {
            List<Placemark> placemarks = await placemarkFromCoordinates(
              geoState.currentPosition.latitude,
              geoState.currentPosition.longitude,
            );
            Placemark place = placemarks[0];

            String resultString =
                '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
            context.read<IssueCubit>().setAddress(
                resultString != "" ? resultString : place.name ?? '',
                lat: geoState.currentPosition.latitude,
                lng: geoState.currentPosition.longitude);
            print('IssueCubit updated with address: $resultString');
          } catch (e) {
            print(e);
          }
        }
      },
      child: BlocBuilder<IssueCubit, ProgressIssue>(
        builder: (context, state) {
          print("Current state in BlocBuilder: ${state.address}");
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.all_field_needed,
                        style:
                            const TextStyle(fontSize: 17, letterSpacing: -0.4),
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ComponentFactory.getBorderedTextField(
                    placeHolder: AppLocalizations.of(context)!.name_desc,
                    value: state.name,
                    onChanged: (value) {
                      context.read<IssueCubit>().setName(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ComponentFactory.getBorderedTextField(
                    placeHolder: AppLocalizations.of(context)!.surname_desc,
                    value: state.surname,
                    onChanged: (value) {
                      context.read<IssueCubit>().setSurname(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ComponentFactory.getBorderedTextField(
                    title: AppLocalizations.of(context)!.email_desc,
                    value: state.email,
                    placeHolder: 'name@email.com',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      context.read<IssueCubit>().setEmail(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ComponentFactory.getBorderedTextField(
                      placeHolder: AppLocalizations.of(context)!.phone_desc,
                      value: state.phone,
                      onChanged: (value) {
                        context.read<IssueCubit>().setPhoneNUmber(value);
                      },
                      keyboardType: TextInputType.phone),
                  const SizedBox(
                    height: 20,
                  ),
                  ComponentFactory.getAutocompleteTextField(
                      placeHolder: AppLocalizations.of(context)!.address_desc,
                      value: state.address,
                      onFieldSubmitted: (value) async {
                        try {
                          List<Location> locations =
                              await locationFromAddress(value);
                          Location first = locations.first;
                          context.read<IssueCubit>().setAddress(value,
                              lat: first.latitude, lng: first.longitude);
                        } catch (e) {
                          print('location $e non trovata');
                        }
                      },
                      customIcon: IconButton(
                          onPressed: () async {
                            context
                                .read<GeolocationBloc>()
                                .getCurrentPosition();
                          },
                          icon: const Icon(Icons.gps_fixed_outlined))),
                  const SizedBox(
                    height: 20,
                  ),
                  ComponentFactory.getBorderedTextField(
                    placeHolder: AppLocalizations.of(context)!.content_desc,
                    value: state.content,
                    height: 200,
                    onChanged: (value) {
                      context.read<IssueCubit>().setMessage(value);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
