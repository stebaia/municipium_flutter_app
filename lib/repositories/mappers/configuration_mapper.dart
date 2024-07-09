import 'dart:convert';

import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:pine/utils/mapper.dart';

class ConfigurationsMapper extends Mapper<Configurations, String> {
  @override
  String from(Configurations from) => jsonEncode(<String, dynamic>{
        'dossier_serv_estratto_conto': from.dossierServEstrattoConto,
        'digital_dossier_menu': from.digitalDossierMenu,
        'dossier_serv_notifiche': from.dossierServNotifiche,
        'autenticazione_spid': from.autenticazioneSpid,
        'autenticazione_cie': from.autenticazioneCie,
        'read_qr_code_mercati': from.readQrCodeMercati,
      });

  @override
  Configurations to(String to) {
    final json = jsonDecode(to);
    return Configurations(
      dossierServEstrattoConto: json['dossier_serv_estratto_conto'],
      digitalDossierMenu: json['digital_dossier_menu'],
      dossierServNotifiche: json['dossier_serv_notifiche'],
      autenticazioneSpid: json['autenticazione_spid'],
      autenticazioneCie: json['autenticazione_cie'],
      readQrCodeMercati: json['read_qr_code_mercati'],
    );
  }
}
