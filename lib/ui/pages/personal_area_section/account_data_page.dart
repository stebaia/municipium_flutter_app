import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/user/user_spid_model.dart';
import 'package:municipium/ui/components/custom_row.dart';
import 'package:municipium/utils/municipium_utility.dart';

@RoutePage()
class AccountDataPage extends StatelessWidget {
  const AccountDataPage({super.key, required this.userModel});
  final SpidUserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.text_account_data.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowWithHeader(
                name: AppLocalizations.of(context)!.text_name_surname,
                value: '${userModel.nome} ${userModel.cognome}',
              ),
              const SizedBox(height: 20,),
              CustomRowWithHeader(
                name: AppLocalizations.of(context)!.text_fiscal_code,
                value: '${userModel.codiceFiscale}',
              ),
              const SizedBox(height: 20,),
              CustomRowWithHeader(
                name: AppLocalizations.of(context)!.text_born_date,
                value: MunicipiumUtility.convertDate(userModel.nascitaData.toString(), 'yyyy-MM-dd'),
              ),
              const SizedBox(height: 20,),
              CustomRowWithHeader(
                name: AppLocalizations.of(context)!.text_residence,
                value: '${userModel.residenzaCitta}',
              ),
              const SizedBox(height: 20,),
              CustomRowWithHeader(
                name: AppLocalizations.of(context)!.text_email,
                value: '${userModel.mailAddress}',
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
