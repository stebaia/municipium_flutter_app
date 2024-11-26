class EcoattiviAzione {
  int? azioneId;
  String? titolo;
  String? desc;
  int? punti;
  bool? eseguita;

  EcoattiviAzione({
    this.azioneId,
    this.titolo,
    this.desc,
    this.punti,
    this.eseguita,
  });

  factory EcoattiviAzione.fromJson(Map<String, dynamic> json) {
    return EcoattiviAzione(
      azioneId: json['azioneId'] as int?,
      titolo: json['titolo'] as String?,
      desc: json['desc'] as String?,
      punti: json['punti'] as int?,
      eseguita: json['eseguita'] as bool?,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'azioneId': azioneId,
      'titolo': titolo,
      'desc': desc,
      'punti': punti,
      'eseguita': eseguita,
    };
  }
}
