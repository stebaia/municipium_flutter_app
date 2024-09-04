import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/custom_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/ui/components/dialogs/standard_dialog.dart';

@RoutePage()
class PersonalAreaMenuPage extends StatelessWidget {
  const PersonalAreaMenuPage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.title_personal_area.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            leading: GestureDetector(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: const Icon(Icons.menu),
            )),
        body: BlocBuilder<UserDataCubit, SpidUserModel?>(
          builder: (context, userSpid) {
            if (userSpid!.authId != null) {
              return Column(
                children: [
                  CustomRowMenu(
                      title: AppLocalizations.of(context)!
                          .text_section_account_data,
                      icon: CupertinoIcons.person,
                      tap: () {
                        context
                            .pushRoute(AccountDataRoute(userModel: userSpid));
                      }),
                  CustomRowMenu(
                      title: AppLocalizations.of(context)!.text_section_payment,
                      icon: CupertinoIcons.creditcard,
                      tap: () {}),
                  municipality.newMenu.services != null
                      ? CustomRowMenu(
                          title: AppLocalizations.of(context)!
                              .text_section_online_service,
                          icon: CupertinoIcons.device_desktop,
                          tap: () {
                            context.pushRoute(ServiceOnlineListRoute());
                          })
                      : Container(),
                  CustomRowMenu(
                      title: AppLocalizations.of(context)!
                          .text_section_personal_messages,
                      icon: CupertinoIcons.bell,
                      tap: () {}),
                  CustomRowMenu(
                      title: AppLocalizations.of(context)!
                          .text_section_reservation,
                      icon: CupertinoIcons.calendar_today,
                      tap: () {}),
                  municipality.newMenu.issue != null
                      ? CustomRowMenu(
                          title:
                              AppLocalizations.of(context)!.text_section_issues,
                          icon: Icons.warning_amber_rounded,
                          tap: () {})
                      : Container(),
                  municipality.newMenu.surveys != null
                      ? CustomRowMenu(
                          title: AppLocalizations.of(context)!
                              .text_section_surveys,
                          icon: CupertinoIcons.chart_bar,
                          tap: () {})
                      : Container(),
                  CustomRowMenu(
                      title: AppLocalizations.of(context)!
                          .text_section_account_preferences,
                      icon: FontAwesomeIcons.userCheck,
                      tap: () {
                        context.pushRoute(const AccountPrefereceRoute());
                      }),
                  CustomRowMenu(
                      title: AppLocalizations.of(context)!.text_logout_title,
                      icon: FontAwesomeIcons.userCheck,
                      tap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomBaseDialog(
                              callback: () {
                                context.read<UserDataCubit>().delete();
                                Navigator.maybePop(context);
                              },
                              title: AppLocalizations.of(context)!
                                  .text_logout_title,
                              description: AppLocalizations.of(context)!
                                  .text_logout_description),
                        );
                      })
                ],
              );
            } else {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .text_login_title_personal_area,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .text_login_subtitle_personal_area,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () =>
                              context.pushRoute(const LoginSpidIdpListRoute()),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 200,
                            height: 140,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).disabledColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.person),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(AppLocalizations.of(context)!
                                    .text_spid_title)
                              ],
                            ),
                          ),
                        ),
                        /*Expanded(child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).cardColor),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [],
                          ),
                        ))*/
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
