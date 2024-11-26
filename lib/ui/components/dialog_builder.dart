import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> dialogBuilder(BuildContext context, {String? routeName}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pop(); // Close the dialog
        if (routeName != null) {
          context.router.popUntilRouteWithName(routeName);
        }
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
}
