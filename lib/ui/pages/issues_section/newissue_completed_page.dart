import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class NewissueCompletedPage extends StatelessWidget {
  NewissueCompletedPage({super.key, required this.udid});
  String udid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    AppLocalizations.of(context)!.issue_sended_desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.4),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          decoration: const BoxDecoration(),

          // Optional padding
          child: ElevatedButton(
            onPressed: () {
              context.pushRoute(IssuesListRoute(udid: udid));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeHelper.blueMunicipium,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(20),
            ),
            child: Text(
              AppLocalizations.of(context)!.issue_history,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}
