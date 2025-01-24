import 'package:pine/dto/dto.dart';

class EcoMessageDto extends DTO {
  int? messaggioId;
  bool? letto;
  String? data;
  String? titolo;
  String? url;

  // Costruttore
  EcoMessageDto({
    this.messaggioId,
    this.letto,
    this.data,
    this.titolo,
    this.url,
  });

  // Metodo per la deserializzazione da JSON
  factory EcoMessageDto.fromJson(Map<String, dynamic> json) {
    return EcoMessageDto(
      messaggioId: json['messaggioId'] as int?,
      letto: json['letto'] as bool?,
      data: json['data'] as String?,
      titolo: json['titolo'] as String?,
      url: json['url'] as String?,
    );
  }

  // Metodo per la serializzazione in JSON
  Map<String, dynamic> toJson() {
    return {
      'messaggioId': messaggioId,
      'letto': letto,
      'data': data,
      'titolo': titolo,
      'url': url,
    };
  }
}
