import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/lissi_bloc/lissi_auth_bloc/lissi_auth_bloc.dart';
import 'package:municipium/bloc/bloc/lissi_bloc/lissi_presentation_template_bloc/lissi_presentation_template_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';

@RoutePage()
class LissiDashboardPage extends StatelessWidget implements AutoRouteWrapper {
  const LissiDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Lissi Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: BlocBuilder<LissiAuthBloc, LissiAuthState>(
          builder: (context, state) {
            if (state is FetchingLissiTokenState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchedLissiTokenState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => context.pushRoute(const LissiPresentationTemplateListRoute()),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.34,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).highlightColor,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(CupertinoIcons.search,),
                          
                          Text(
                            'Verifica documenti',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text('Verifica documenti del cittadino'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                 Container(
                    height: MediaQuery.of(context).size.height * 0.34,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).highlightColor,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.wallet,),
                        
                        Text(
                          'I miei documenti',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text('Guarda i tuoi documenti'),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is ErrorLissiTokenState) {
              return const Text('Error');
            } else {
              return Container();
            }
          },
        ));
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              LissiAuthBloc(lissiRepository: context.read())..fetchLissiToken(),
        ),
      ], child: this);
}
