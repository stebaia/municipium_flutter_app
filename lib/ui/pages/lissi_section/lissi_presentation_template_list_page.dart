import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/lissi_bloc/lissi_presentation_template_bloc/lissi_presentation_template_bloc.dart';
import 'package:municipium/model/lissi/prestenation_lissi_template.dart';
import 'package:municipium/routers/app_router.gr.dart';

@RoutePage()
class LissiPresentationTemplateListPage extends StatelessWidget
    implements AutoRouteWrapper {
  const LissiPresentationTemplateListPage({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Presentation Templates',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: BlocBuilder<LissiPresentationTemplateBloc,
          PresentationTemplatesState>(
        builder: (context, state) {
          if (state is FetchingPresentationTemplatesState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchedPresentationTemplatesState) {
            final List<PrestenationLissiTemplateContent> presentationTemplates =
                state.presentationTemplates;
            return ListView.builder(
              itemCount: presentationTemplates.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context.pushRoute(LissiPresentationSessionRoute(
                      presentationSessionId: presentationTemplates[index]
                          .presentationTemplateId!)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          presentationTemplates[index]
                                  .presentationTemplateName ??
                              '',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Icon(CupertinoIcons.chevron_right),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is NoPresentationTemplatesState) {
            return const Center(child: Text("No data"));
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => LissiPresentationTemplateBloc(
              presentationTemplatesRepository: context.read())
            ..fetchPresentationTemplates(),
        ),
      ], child: this);
}
