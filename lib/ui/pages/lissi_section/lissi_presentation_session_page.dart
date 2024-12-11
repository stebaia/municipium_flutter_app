import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/lissi_bloc/lissi_presentation_session_bloc/lissi_presentation_session_bloc.dart';
import 'package:municipium/model/lissi/lissi_presentation_template_info.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class LissiPresentationSessionPage extends StatelessWidget
    implements AutoRouteWrapper {
  const LissiPresentationSessionPage(
      {super.key, required this.presentationSessionId});

  final String presentationSessionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Presentation Session',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: BlocConsumer<LissiPresentationSessionBloc,
          LissiPresentationSessionState>(
            buildWhen: (previous, current) {
              return current is! ConfirmedPresentationSessionState;
            },
            listener: (context, state) {
              if (state is CreatedPresentationSessionState) {
                
              }else if (state is ConfirmedPresentationSessionState) { 
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Presentation Session confermata con successo')));
              }
            },
        builder: (context, state) {
          if (state is CreatingPresentationSessionState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CreatedPresentationSessionState)  {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(state.presentationSession.presentationTemplateName, style: Theme.of(context).textTheme.titleMedium),
                   Text('Scannerizza questo QR Code', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: QrImageView(
                      data: state.presentationSession.presentationRequestUri,
                      version: QrVersions.auto,
                      size: 200.0,
                      gapless: false,
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            'Uh oh! Something went wrong...',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),

                  Container(padding: const EdgeInsets.all(20),child: FullWidthConfirmButton(isEnabled: true, onTap: () {
                    context.read<LissiPresentationSessionBloc>().confirmPresentationSession(state.presentationSession.presentationSessionId);
                  })),
                  const SizedBox(height: 40,),
                ],
              ),
            );
          } else if (state is ErrorPresentationSessionState) {
            return const Text('Error');
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                LissiPresentationSessionBloc(lissiRepository: context.read())
                  ..createPresentationSession(LissiPresentationTemplateInfo(
                      presentationTemplateName: presentationSessionId))),
      ], child: this);
}
