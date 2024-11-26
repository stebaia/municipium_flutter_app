import 'package:municipium/model/ecoattivi/ecoattivi_situazione_utente.dart';
import 'package:municipium/repositories/mappers/ecoattivi_mapper/ecoattivi_azione_mapper.dart';
import 'package:municipium/services/network/dto/ecoattivi_situazione_utente_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class EcoattiviSituazioneUtenteMapper
    extends DTOMapper<EcoattiviSituazioneUtenteDto, EcoattiviSituazioneUtente> {
  @override
  EcoattiviSituazioneUtente fromDTO(EcoattiviSituazioneUtenteDto dto) {
    EcoattiviAzioneMapper ecoattiviAzioneMapper = EcoattiviAzioneMapper();
    return EcoattiviSituazioneUtente(
        codiceAmico: dto.codiceAmico,
        msgNonLetti: dto.msgNonLetti,
        livelloUtente: dto.livelloUtente,
        saldoPunti: dto.saldoPunti,
        puntiInvitaAmico: dto.puntiInvitaAmico,
        quizDaFare: dto.quizDaFare,
        missioniDaFare: dto.missioniDaFare,
        azioni:
            dto.azioni?.map((e) => ecoattiviAzioneMapper.fromDTO(e)).toList());
  }

  @override
  EcoattiviSituazioneUtenteDto toDTO(EcoattiviSituazioneUtente model) {
    return EcoattiviSituazioneUtenteDto();
  }
}
