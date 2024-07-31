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
            if(userSpid != null) {
              return Column(
              children: [
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_account_data, icon: CupertinoIcons.person, tap: (){}),
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_payment, icon: CupertinoIcons.creditcard, tap: (){}),
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_online_service, icon: CupertinoIcons.device_desktop, tap: (){}),
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_personal_messages, icon: CupertinoIcons.bell, tap: (){}),
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_reservation, icon: CupertinoIcons.calendar_today, tap: (){}),
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_issues, icon: Icons.warning_amber_rounded, tap: (){}),
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_surveys, icon: CupertinoIcons.chart_bar, tap: (){}),
                CustomRowMenu(title: AppLocalizations.of(context)!.text_section_account_preferences, icon: FontAwesomeIcons.userCheck, tap: (){})
              ],
            );
            }else {
              return Column(
              children: [
                Center(
                    child: TextButton(
                        onPressed: () {
                          context.pushRoute(const LoginSpidIdpListRoute());
                        },
                        child: Text(
                          'login',
                          style: TextStyle(fontSize: 30),
                        )))
              ],
            );
            }
            
          },
        ));
  }
}
