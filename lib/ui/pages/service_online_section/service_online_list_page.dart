import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/service_online_bloc/service_online_bloc.dart';
import 'package:municipium/model/online_service/online_service.dart';

@RoutePage()
class ServiceOnlineListPage extends StatelessWidget implements AutoRouteWrapper {
  const ServiceOnlineListPage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

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
          child: BlocBuilder<ServiceOnlineBloc, ServiceOnlineState>(
            builder: (context, state) {
              if (state is FetchedServiceOnlineState) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.onlineServiceList.length,
                  itemBuilder: (context, index) {
                    OnlineService onlineService =
                        state.onlineServiceList[index];
                    return GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(onlineService.name ?? '', style: Theme.of(context).textTheme.titleMedium,),
                                  const SizedBox(height: 6,),
                                  Text(onlineService.link ?? '',  style: Theme.of(context).textTheme.titleSmall, overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.chevron_right))
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
  
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
    BlocProvider<ServiceOnlineBloc>(
          create: (context) =>
              ServiceOnlineBloc(onlineServiceRepository: context.read())..fetchServiceList(),
        )
  ], child: this);
}
