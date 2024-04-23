import 'package:equatable/equatable.dart';
import 'package:municipium/model/menu/municipium_civildefence_submenu.dart';
import 'package:municipium/model/menu/municipium_dms_submenu.dart';
import 'package:municipium/model/menu/municipium_garbage_submenu.dart';

class MunicipiumMenu extends Equatable {
  final String? news;
  final String? issue;
  final String? penalties;
  final String? surveys;
  final String? ecoattivi;
  final String? poi;
  final String? services;
  final String? kml;
  final String? digital_dossier;
  final String? payment;
  final String? events;
  final MunicipiumGarbageSubmenu? garbage;
  final MunicipiumDmsSubmenu? dms;
  final MunicipiumCivilDefenceSubmenu? civil_defence;

  const MunicipiumMenu(
      {this.news,
      this.issue,
      this.penalties,
      this.surveys,
      this.ecoattivi,
      this.poi,
      this.services,
      this.kml,
      this.digital_dossier,
      this.payment,
      this.events,
      this.garbage,
      this.dms,
      this.civil_defence});

  @override
  // TODO: implement props
  List<Object?> get props => [
        news,
        issue,
        penalties,
        surveys,
        ecoattivi,
        poi,
        services,
        kml,
        digital_dossier,
        payment,
        events,
        garbage,
        dms,
        civil_defence
      ];
}
