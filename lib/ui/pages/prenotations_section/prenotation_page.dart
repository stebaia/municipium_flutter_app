import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/bloc/cubit/municipality_stored_cubit.dart';
import 'package:municipium/bloc/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/ui/components/webview/custom_webview.dart';

@RoutePage()
class PrenotationPage extends StatelessWidget {
  const PrenotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = context.read<MunicipalityStoredCubit>().state!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.prenotation_menu.toUpperCase(),  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      body: Container(
        child: BlocBuilder<UserDataCubit, SpidUserModel>(
          builder: (context, user) {
            if(user.authId != null) {
              return CustomWebView(url: '${municipality.prenotationWebUrl}?sportello=&municipality=${municipality.muninicipalityId}&servizio=&unita=&nome=${user.nome}&cognome=${user.nome}&email=${user.mailAddress}&mobile=${user.cellulare}&orientation=vertical&labelposition=end');
            }else {
              return CustomWebView(url: '${municipality.prenotationWebUrl}?sportello=&municipality=${municipality.muninicipalityId}&servizio=&unita=&nome=&cognome=&email=&orientation=vertical&labelposition=end');
            }
            
          },
        ),
      ),
    );
  }
}
