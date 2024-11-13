import 'package:pine/dto/dto.dart';

class EcoattiviMovimentoUtenteDto extends DTO {
  String idUnivoco;
  String origine;
  String descTipoAzione;
  int punti;
  String dataOraUTC;

  // Costruttore
  EcoattiviMovimentoUtenteDto({
    required this.idUnivoco,
    required this.origine,
    required this.descTipoAzione,
    required this.punti,
    required this.dataOraUTC,
  });

  // Metodo per la deserializzazione da JSON
  factory EcoattiviMovimentoUtenteDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviMovimentoUtenteDto(
      idUnivoco: json['IdUnivoco'] as String,
      origine: json['Origine'] as String,
      descTipoAzione: json['DescTipoAzione'] as String,
      punti: json['Punti'] as int,
      dataOraUTC: json['DataOraUTC'] as String,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'IdUnivoco': idUnivoco,
      'Origine': origine,
      'DescTipoAzione': descTipoAzione,
      'Punti': punti,
      'DataOraUTC': dataOraUTC,
    };
  }
}
