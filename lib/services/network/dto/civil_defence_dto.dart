import 'package:municipium/model/menu/submenu_type.dart';

class CivilDefenceDTO extends SubMenuType {
  String? civilDefencePhoneNumbers;
  String? civilDefenceLevels;
  String? civilDefenceAlertsNews;
  String? civilDefenceInformations;
  String? civilDefenceAreYouReady;

  CivilDefenceDTO(
      {this.civilDefencePhoneNumbers,
      this.civilDefenceLevels,
      this.civilDefenceAlertsNews,
      this.civilDefenceInformations,
      this.civilDefenceAreYouReady});

  CivilDefenceDTO.fromJson(Map<String, dynamic> json) {
    civilDefencePhoneNumbers = json['civil_defence_phone_numbers'];
    civilDefenceLevels = json['civil_defence_levels'];
    civilDefenceAlertsNews = json['civil_defence_alerts_news'];
    civilDefenceInformations = json['civil_defence_informations'];
    civilDefenceAreYouReady = json['civil_defence_are_you_ready'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['civil_defence_phone_numbers'] = this.civilDefencePhoneNumbers;
    data['civil_defence_levels'] = this.civilDefenceLevels;
    data['civil_defence_alerts_news'] = this.civilDefenceAlertsNews;
    data['civil_defence_informations'] = this.civilDefenceInformations;
    data['civil_defence_are_you_ready'] = this.civilDefenceAreYouReady;
    return data;
  }
}
