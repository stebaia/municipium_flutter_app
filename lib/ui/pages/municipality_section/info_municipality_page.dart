import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/info_municipality_bloc/info_municipality_pages/info_municipality_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/model/pages/pages.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class InfoMunicipalityPage extends StatelessWidget implements AutoRouteWrapper {
  const InfoMunicipalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = context.read<MunicipalityStoredCubit>().state!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          municipality.municipalityName.toUpperCase(),
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: municipality.background != null
                    ? Image.network(
                        '${municipality.background?.baseUrl}${municipality.background?.i640}',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        '${municipality.image?.baseUrl}${municipality.image?.i640}',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(municipality.description!),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.label_citizens,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(municipality.citizensNumber.toString()),
                ],
              ),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.label_surface,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(municipality.surface!),
                ],
              ),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.label_zip_code,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(municipality.zipCode!),
                ],
              ),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.label_prefix,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(municipality.prefix!),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<InfoMunicipalityBloc, InfoMunicipalityPageState>(
                builder: (context, state) {
                  if (state is FetchedListPageInfoMunicipalityState) {
                    List<Pages> pages =
                        state.pageList.where((p) => p.parentId == null).toList();
                    for (int i = 0; i < pages.length; i++) {
                      pages[i].children = state.pageList
                          .where((p) => p.parentId == pages[i].id)
                          .toList();
                    }

                    return Flexible(
                        child: ListView.separated(
                      primary: false,
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: pages.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(pages[index].title ?? ''),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => onPushFromType(
                            context, pages[index].itemType ?? 'P', pages[index]),
                      ),
                    ));
                  } else if (state is FetchingListPageInfoMunicipalityState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPushFromType(BuildContext context, String type, Pages page,) async {
    switch (type) {
      case 'S': 
      case 'P':
        context.pushRoute(InfoMunicipalityDetailRoute(id: page.id, pages: page.children));
        break;
      case 'L':
        await launchUrl(Uri.parse(page.link!));
        break;
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InfoMunicipalityBloc(
                infoMunicipalityRepository: context.read())
              ..fetchInfoMunicipality(
                  Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
          )
        ],
        child: this,
      );
}
