import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:municipium/bloc/cubit/checkbox_cubit/checkbox_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:municipium/bloc/bloc/user_bloc/user_bloc.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/dialog_builder.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class WebViewSpidAuthPage extends StatefulWidget implements AutoRouteWrapper {
  WebViewSpidAuthPage(
      {super.key,
      required this.urlSpid,
      required this.municipalityId,
      required this.authSystem,
      required this.ecoattivi});
  final String urlSpid;
  final String municipalityId;
  final String authSystem;
  final bool ecoattivi;
  String? token;
  SpidUserModel? spidUserModel;

  @override
  State<WebViewSpidAuthPage> createState() => _WebViewSpidAuthPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(userRepository: context.read())
            ..fetchListIdp(
                Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl),
        )
      ], child: this);
}

class _WebViewSpidAuthPageState extends State<WebViewSpidAuthPage> {
  late WebViewController webViewController;
  String myUserAgent = 'Unknown';

  String pathLoginOK = '/loginOk';
  String urlToCheck =
      "http://webservice.municipiumapp.it/paypal/success?authId=";

  Future<void> _getUserAgent() async {
    String? userAgent = await webViewController
        .runJavaScriptReturningResult('navigator.userAgent') as String;
    setState(() {
      myUserAgent = userAgent ?? 'Unknown';
    });
  }

  /*Future<void> _dialogBuilder(BuildContext context, bool ecoattivi) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Close the dialog
          context.router.popUntilRouteWithName(
              ecoattivi ? EcoattiviHomeRoute.name : CoreMunicipalityRoute.name);
        });
        return AlertDialog(
          content: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dialog_success_account_spid,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Lottie.asset('assets/lottie/success.json',
                      width: 160, height: 160),
                ],
              )),
        );
      },
    );
  }*/

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController();

    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        print(request.url);
        if (request.url.contains(pathLoginOK) ||
            request.url.contains(urlToCheck)) {
          RegExp regExp = RegExp(r"authId=([^&]+)");
          RegExpMatch? match = regExp.firstMatch(request.url);

          // Controlla se c'è una corrispondenza e stampa il valore di authId
          if (match != null) {
            String authId = match.group(1)!;
            print("authId: $authId");
            widget.token = authId;
            if (request.url.contains(urlToCheck)) {
              context.read<UserBloc>().fetchUserSpid(
                  Provider.of<BaseUrlNotifier>(context, listen: false)
                      .baseUrlMmc,
                  authId,
                  widget.municipalityId,
                  widget.authSystem,
                  '');
            }
          } else {
            print("authId non trovato");
          }
        }
        if (request.url.contains('/group/')) {
          // Handle group URL
          _getUserAgent();
          webViewController.setUserAgent('$myUserAgent; municipium');
        }

        return NavigationDecision.navigate;
      },
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      webViewController.loadRequest(Uri.parse(widget.urlSpid));
    });
  }

  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Scaffold(
      appBar: AppBar(
        title: Text('SPID Authorization'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is FetchedUserDataState) {
            context.read<UserDataCubit>().auth(state.userSpidModel);
            widget.spidUserModel = state.userSpidModel;
            if (widget.ecoattivi) {
              Future.delayed(Duration(seconds: 3), () {
                Navigator.of(context).pop(); // Close the dialog
                context.router.popUntilRouteWithName(EcoattiviHomeRoute.name);
              });
              /*context.read<UserBloc>().validatedUser(
                  Provider.of<BaseUrlNotifier>(context, listen: false)
                      .baseUrlMmc,
                  state.userSpidModel,
                  '',
                  municipality.istat,
                  widget.token ?? '',
                  false);*/
            } else {
              dialogBuilder(context, routeName: CoreMunicipalityRoute.name);
            }
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: WebViewWidget(controller: webViewController),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('User Agent: $myUserAgent'),
            ),
          ],
        ),
      ),
    );
  }
}
