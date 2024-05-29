import 'package:municipium/model/menu/submenu_type.dart';

enum MenuItemType {
  news,
  events,
  issue,
  penalties,
  surveys,
  garbage,
  ecoattivi,
  sportelloTelematico,
  poi,
  services,
  dms,
  digitalDossier,
  civilDefence,
  payment
}

class SubMenuItemType {}

enum GarbageMenuType implements SubMenuItemType {
  recyclyngAreas,
  garbageCollectors,
  garbageCalendars,
  garbageCategories
}

enum CivilDefenceType implements SubMenuItemType {
  civilDefencePhoneNumbers,
  civilDefenceLevels,
  civilDefenceAlertNews,
  civilDefenceInformations,
  civilDefenceAreUReady
}

enum DmsType implements SubMenuItemType { eatery, host, poi, experience }

enum PnrrType {
  puntiContatto,
  titolo,
  allegato,
  unitaOrganizzativa,
  documento,
  arrayCategory,
  unitaOrganizzativaPrenotazioni,
  puntiDinteresse,
  personaPubblica,
  servizi,
  urlDocumento,
  incarichi;

  String get code {
    switch (this) {
      case PnrrType.puntiContatto:
        return "PC";
      case PnrrType.titolo:
        return "S";
      case PnrrType.allegato:
        return "A";
      case PnrrType.unitaOrganizzativa:
        return "UO";
      case PnrrType.documento:
        return "DP";
      case PnrrType.arrayCategory:
        return "AR";
      case PnrrType.unitaOrganizzativaPrenotazioni:
        return "UO-P";
      case PnrrType.puntiDinteresse:
        return "POI";
      case PnrrType.personaPubblica:
        return "PP";
      case PnrrType.servizi:
        return "SR";
      case PnrrType.urlDocumento:
        return "S-U";
      case PnrrType.incarichi:
        return "I";
      default:
        return "";
    }
  }

  static PnrrType? fromCode(String code) {
    switch (code) {
      case "PC":
        return PnrrType.puntiContatto;
      case "S":
        return PnrrType.titolo;
      case "A":
        return PnrrType.allegato;
      case "UO":
        return PnrrType.unitaOrganizzativa;
      case "DP":
        return PnrrType.documento;
      case "AR":
        return PnrrType.arrayCategory;
      case "UO-P":
        return PnrrType.unitaOrganizzativaPrenotazioni;
      case "POI":
        return PnrrType.puntiDinteresse;
      case "PP":
        return PnrrType.personaPubblica;
      case "SR":
        return PnrrType.servizi;
      case "S-U":
        return PnrrType.urlDocumento;
      case "I":
        return PnrrType.incarichi;
      default:
        return null;
    }
  }
}
