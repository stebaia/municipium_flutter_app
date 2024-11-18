import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/civil_defence/civil_defence_level.dart';
import 'package:municipium/repositories/civil_defence_repository.dart';

part 'civil_defence_level_event.dart';
part 'civil_defence_level_state.dart';

class CivilDefenceLevelsBloc
    extends Bloc<CivilDefenceLevelsEvent, CivilDefenceLevelsState> {
  final CivilDefenceRepository civilDefenceRepository;

  CivilDefenceLevelsBloc({required this.civilDefenceRepository})
      : super(const FetchingCivilDefenceLevelsState()) {
    on<FetchCivilDefenceLevelsEvent>(_fetchCivilDefenceLevels);
  }

  void fetchCivilDefenceLevels(String baseUrl, String type) =>
      add(FetchCivilDefenceLevelsEvent(baseUrl, type));

  FutureOr<void> _fetchCivilDefenceLevels(FetchCivilDefenceLevelsEvent event,
      Emitter<CivilDefenceLevelsState> emit) async {
    emit(const FetchingCivilDefenceLevelsState());
    try {
      final civilDefenceLevels = await civilDefenceRepository
          .getCivilDefenceLevels(event.baseUrl, event.type);
      emit(FetchedCivilDefenceLevelsState(civilDefenceLevels));
    } catch (error) {
      emit(const ErrorCivilDefenceLevelsState());
    }
  }
}
