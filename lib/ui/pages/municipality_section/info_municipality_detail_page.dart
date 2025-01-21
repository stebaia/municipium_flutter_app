import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/info_municipality_bloc/info_municipality_detail_page_bloc/bloc/info_municipality_detail_page_bloc.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class InfoMunicipalityDetailPage extends StatelessWidget
    implements AutoRouteWrapper {
  const InfoMunicipalityDetailPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<InfoMunicipalityDetailPageBloc, InfoMunicipalityState>(
          builder: (context, state) {
             if(state is FetchedInfoMunicipalityState){
              return Text(state.pageDetail.title);
            }
            return Text("Info");
          },
        ),
      ),
      body: const Center(
        child: Text("Info Municipality"),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => InfoMunicipalityDetailPageBloc(
                  infoMunicipalityRepository: context.read())..fetchInfoMunicipality(Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl, id)),
        ],
        child: this,
      );
}
