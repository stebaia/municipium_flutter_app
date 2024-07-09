class Configurations {
  bool? dossierServEstrattoConto;
  bool? digitalDossierMenu;
  bool? dossierServNotifiche;
  bool? autenticazioneSpid;
  bool? autenticazioneCie;
  bool? readQrCodeMercati;

  Configurations(
      {this.dossierServEstrattoConto,
      this.digitalDossierMenu,
      this.dossierServNotifiche,
      this.autenticazioneSpid,
      this.autenticazioneCie,
      this.readQrCodeMercati});

  Configurations.fromJson(Map<String, dynamic> json) {
    dossierServEstrattoConto = json['dossier_serv_estratto_conto'];
    digitalDossierMenu = json['digital_dossier_menu'];
    dossierServNotifiche = json['dossier_serv_notifiche'];
    autenticazioneSpid = json['autenticazione_spid'];
    autenticazioneCie = json['autenticazione_cie'];
    readQrCodeMercati = json['read_qr_code_mercati'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dossier_serv_estratto_conto'] = this.dossierServEstrattoConto;
    data['digital_dossier_menu'] = this.digitalDossierMenu;
    data['dossier_serv_notifiche'] = this.dossierServNotifiche;
    data['autenticazione_spid'] = this.autenticazioneSpid;
    data['autenticazione_cie'] = this.autenticazioneCie;
    data['read_qr_code_mercati'] = this.readQrCodeMercati;
    return data;
  }
}
