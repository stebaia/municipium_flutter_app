import 'package:pine/dto/dto.dart';

class UserToValidateDto extends DTO {
  String? service;
  String? tel;
  String? codiceAmico;
  int? istat;
  String? codiceFiscale;
  String? token;
  int? flagPrivacy;
  String? email;
  String? cognome;
  String? nome;

  UserToValidateDto({
    this.service,
    this.tel,
    this.codiceAmico,
    this.istat,
    this.codiceFiscale,
    this.token,
    this.flagPrivacy,
    this.email,
    this.cognome,
    this.nome,
  });

  // Factory constructor to create an instance from JSON
  factory UserToValidateDto.fromJson(Map<String, dynamic> json) {
    return UserToValidateDto(
      service: json['service'] as String?,
      tel: json['tel'] as String?,
      codiceAmico: json['codiceAmico'] as String?,
      istat: json['istat'] as int?,
      codiceFiscale: json['codiceFiscale'] as String?,
      token: json['token'] as String?,
      flagPrivacy: json['flagPrivacy'] as int?,
      email: json['email'] as String?,
      cognome: json['cognome'] as String?,
      nome: json['nome'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'service': service,
      'tel': tel,
      'codiceAmico': codiceAmico,
      'istat': istat,
      'codiceFiscale': codiceFiscale,
      'token': token,
      'flagPrivacy': flagPrivacy,
      'email': email,
      'cognome': cognome,
      'nome': nome,
    };
  }
}
