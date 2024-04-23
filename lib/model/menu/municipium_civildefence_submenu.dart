import 'package:equatable/equatable.dart';

class MunicipiumCivilDefenceSubmenu extends Equatable {
  final String? civil_defence_phone_numbers;
  final String? civil_defence_levels;
  final String? civil_defence_alerts_news;
  final String? civil_defence_informations;
  final String? civil_defence_are_you_ready;

  const MunicipiumCivilDefenceSubmenu(
      {this.civil_defence_phone_numbers,
      this.civil_defence_levels,
      this.civil_defence_alerts_news,
      this.civil_defence_informations,
      this.civil_defence_are_you_ready});

  @override
  // TODO: implement props
  List<Object?> get props => [
        civil_defence_phone_numbers,
        civil_defence_levels,
        civil_defence_alerts_news,
        civil_defence_informations,
        civil_defence_are_you_ready
      ];
}
