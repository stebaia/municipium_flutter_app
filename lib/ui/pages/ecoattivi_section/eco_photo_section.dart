import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/ecoattivi_photoaction_bloc/ecoattivi_photoaction_bloc.dart';
import 'package:municipium/ui/components/ecoattivi/ecopoints_label.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EcoPhotoSection extends StatelessWidget implements AutoRouteWrapper {
  const EcoPhotoSection({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Carica foto'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.maybePop(),
          ),
        ),
        body: BlocBuilder<EcoattiviPhotoActionBloc, EcoattiviPhotoActionState>(
          builder: (context, state) {
            if (state is ErrorEcoattiviPhotoActionState) {
              return Text('error');
            }
            if (state is FetchedEcoattiviPhotoActionState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.photoActionList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.photoActionList[index].titolo ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(width: 8),
                              EcopointsLabel(
                                  punti:
                                      state.photoActionList[index].punti ?? 0)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Divider(thickness: 0.4),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<EcoattiviPhotoActionBloc>(
            create: (context) =>
                EcoattiviPhotoActionBloc(ecoattiviRepository: context.read())
                  ..fetchPhotoActions(
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .baseUrlEcoattivi,
                      token,
                      Provider.of<BaseUrlNotifier>(context, listen: false)
                          .guidEcoattivi),
          )
        ],
        child: this,
      );
}
