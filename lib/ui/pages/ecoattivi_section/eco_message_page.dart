import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/ecoattivi_message_bloc/ecoattivi_message_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EcoMessagePage extends StatelessWidget implements AutoRouteWrapper {
  final String token;
  const EcoMessagePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messaggi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
      body: BlocBuilder<EcoattiviMessageBloc, EcoattiviMessageState>(
        builder: (context, state) {
          if (state is FetchedEcoattiviMessageState) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: state.ecoattiviMessages.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => context.router.replace(
                            EcoMessageDetailRoute(
                                detail: state.ecoattiviMessages[index],
                                token: token)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.fiber_manual_record,
                                  color:
                                      (state.ecoattiviMessages[index].letto ??
                                              false)
                                          ? Colors.transparent
                                          : Colors.deepPurple.shade200,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.ecoattiviMessages[index].titolo ??
                                            '',
                                        style: TextStyle(
                                            fontWeight:
                                                (state.ecoattiviMessages[index]
                                                            .letto ??
                                                        false)
                                                    ? FontWeight.w400
                                                    : FontWeight.w900),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                          state.ecoattiviMessages[index].data ??
                                              '')
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 0.5,
                            )
                          ],
                        ),
                      )),
            );
          } else if (state is NoEcoattiviMessageState ||
              state is ErrorEcoattiviMessageState) {
            return const Text('errore');
          } else {
            return ShimmerUtils.buildPoiShimmer(4);
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<EcoattiviMessageBloc>(
            create: (context) =>
                EcoattiviMessageBloc(ecoattiviRepository: context.read())
                  ..fetchMessages(
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .baseUrlEcoattivi,
                      token,
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .guidEcoattivi),
          ),
        ],
        child: this,
      );
}
