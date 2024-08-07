import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:municipium/bloc/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:municipium/bloc/user_bloc/user_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class WebViewSpidAuthPage extends StatefulWidget implements AutoRouteWrapper {
  const WebViewSpidAuthPage({super.key, required this.urlSpid, required this.municipalityId, required this.authSystem});
  final String urlSpid;
  final String municipalityId;
  final String authSystem;

  @override
  State<WebViewSpidAuthPage> createState() => _WebViewSpidAuthPageState();
  
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [BlocProvider<UserBloc>(
          create: (context) =>
              UserBloc(userRepository: context.read())..fetchListIdp(),
        )], child: this);
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

  Future<void> _dialogBuilder(
      BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Close the dialog
          context.router.popUntilRouteWithName(CoreMunicipalityRoute.name);
        });
        return AlertDialog(
          content: Container(height: 300, width: MediaQuery.of(context).size.width, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.dialog_success_account_spid, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              Lottie.asset('assets/lottie/success.json', width: 160, height: 160),
            ],
          )),
          
        );
      },
    );
  }

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
            if (request.url.contains(urlToCheck)) {
              context.read<UserBloc>().fetchUserSpid(authId, widget.municipalityId, widget.authSystem, '');
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
    return Scaffold(
      appBar: AppBar(
        title: Text('SPID Auth WebView'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if(state is FetchedUserDataState) {
            context.read<UserDataCubit>().auth(state.userSpidModel);
            _dialogBuilder(context);
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
