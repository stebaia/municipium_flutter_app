import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecoattivi_missione.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

part 'ecoattivi_missions_event.dart';
part 'ecoattivi_missions_state.dart';

class EcoattiviMissionsBloc
    extends Bloc<EcoattiviMissionsEvent, EcoattiviMissionsState> {
  final EcoattiviRepository ecoattiviRepository;
  EcoattiviMissionsBloc(this.ecoattiviRepository)
      : super(const FetchingEcoattiviMissionsListState()) {
    on<FetchEcoattiviMissionsListEvent>(_fetchEcoattiviMissionsList);
  }

  void fetchEcoattiviMissions(String baseUrl, String token, String guid) =>
      add(FetchEcoattiviMissionsListEvent(
          baseUrl: baseUrl, token: token, guid: guid));

  Future<void> _fetchEcoattiviMissionsList(
      FetchEcoattiviMissionsListEvent event,
      Emitter<EcoattiviMissionsState> emit) async {
    emit(const FetchingEcoattiviMissionsListState());
    try {
      final missionsList = await ecoattiviRepository.getMissions(
          baseUrl: event.baseUrl, token: event.token, guid: event.guid);
      if (missionsList != null) {
        if (missionsList.isEmpty) {
          emit(const NoEcoattiviMissionsListState());
        } else {
          emit(FetchedEcoattiviMissionsListState(missionsList));
        }
      } else {
        emit(const ErrorEcoattiviMissionsListState());
      }
    } catch (_) {
      emit(const ErrorEcoattiviMissionsListState());
    }
  }
}
