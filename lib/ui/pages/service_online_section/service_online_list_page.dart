import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/bloc/service_online_bloc/service_online_bloc.dart';
import 'package:municipium/model/online_service/online_service.dart';
import 'package:municipium/routers/app_router.gr.dart';

@RoutePage()
class ServiceOnlineListPage extends StatelessWidget
    implements AutoRouteWrapper {
  ServiceOnlineListPage({
    super.key,
  });
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.services_menu.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Theme.of(context).primaryColor, ),
                          ),
                          enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey, ),
                          ),
                          
                          hintText: AppLocalizations.of(context)!.text_search_desired_service,
                        ),
                        onChanged: (query) {
                          context.read<ServiceOnlineBloc>().filterServiceList(query);
                          print(query);
                        },
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
              BlocBuilder<ServiceOnlineBloc, ServiceOnlineState>(
                builder: (context, state) {
                  if (state is FetchedServiceOnlineState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),child: Text('${state.onlineServiceList.length} ${AppLocalizations.of(context)!.text_avaiable_services}', style: Theme.of(context).textTheme.titleMedium)),
                        
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.onlineServiceList.length,
                          itemBuilder: (context, index) {
                            OnlineService onlineService =
                                state.onlineServiceList[index];
                            return GestureDetector(
                              onTap: () => context.pushRoute(
                                  OnlineServiceDetailWebviewRoute(
                                      name: onlineService.name ?? '',
                                      url: onlineService.link ?? '')),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context).cardColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            onlineService.name ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            onlineService.link ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(CupertinoIcons.chevron_right)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<ServiceOnlineBloc>(
          create: (context) =>
              ServiceOnlineBloc(onlineServiceRepository: context.read())
                ..fetchServiceList(),
        )
      ], child: this);
}
