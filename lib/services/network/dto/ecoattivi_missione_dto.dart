import 'package:pine/dto/dto.dart';

class EcoattiviMissioneDto extends DTO {
  int? sfidaMissioneId;
  int? tipo;
  String? titolo;
  String? descHtml;
  String? descTxt;
  String? dataInizio;
  String? dataFine;
  int? puntiPalio;
  int? statoSfidaMissioneId;
  String? statoSfidaMissioneDesc;
  int? statoIscrizioneId;
  String? statoIscrizioneDesc;
  int? obiettivoNumero;
  String? obiettivoUnitaMisura;
  int? progressoNumero;

  // Costruttore
  EcoattiviMissioneDto({
    this.sfidaMissioneId,
    this.tipo,
    this.titolo,
    this.descHtml,
    this.descTxt,
    this.dataInizio,
    this.dataFine,
    this.puntiPalio,
    this.statoSfidaMissioneId,
    this.statoSfidaMissioneDesc,
    this.statoIscrizioneId,
    this.statoIscrizioneDesc,
    this.obiettivoNumero,
    this.obiettivoUnitaMisura,
    this.progressoNumero,
  });

  // Metodo per la deserializzazione da JSON
  factory EcoattiviMissioneDto.fromJson(Map<String, dynamic> json) {
    return EcoattiviMissioneDto(
      sfidaMissioneId: json['sfidaMissioneId'] as int?,
      tipo: json['tipo'] as int?,
      titolo: json['titolo'] as String?,
      descHtml: json['descHtml'] as String?,
      descTxt: json['descTxt'] as String?,
      dataInizio: json['dataInizio'] as String?,
      dataFine: json['dataFine'] as String?,
      puntiPalio: json['puntiPalio'] as int?,
      statoSfidaMissioneId: json['statoSfidaMissioneId'] as int?,
      statoSfidaMissioneDesc: json['statoSfidaMissioneDesc'] as String?,
      statoIscrizioneId: json['statoIscrizioneId'] as int?,
      statoIscrizioneDesc: json['statoIscrizioneDesc'] as String?,
      obiettivoNumero: json['obiettivoNumero'] as int?,
      obiettivoUnitaMisura: json['obiettivoUnitaMisura'] as String?,
      progressoNumero: json['progressoNumero'] as int?,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'sfidaMissioneId': sfidaMissioneId,
      'tipo': tipo,
      'titolo': titolo,
      'descHtml': descHtml,
      'descTxt': descTxt,
      'dataInizio': dataInizio,
      'dataFine': dataFine,
      'puntiPalio': puntiPalio,
      'statoSfidaMissioneId': statoSfidaMissioneId,
      'statoSfidaMissioneDesc': statoSfidaMissioneDesc,
      'statoIscrizioneId': statoIscrizioneId,
      'statoIscrizioneDesc': statoIscrizioneDesc,
      'obiettivoNumero': obiettivoNumero,
      'obiettivoUnitaMisura': obiettivoUnitaMisura,
      'progressoNumero': progressoNumero,
    };
  }
}
