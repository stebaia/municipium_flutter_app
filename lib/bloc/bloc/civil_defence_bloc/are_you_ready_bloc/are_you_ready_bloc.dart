import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/civil_defence/civil_defence_are_you_ready.dart';
import 'package:municipium/repositories/civil_defence_repository.dart';

part 'are_you_ready_event.dart';
part 'are_you_ready_state.dart';

class AreYouReadyBloc extends Bloc<AreYouReadyEvent, AreYouReadyState> {
  final CivilDefenceRepository civilDefenceRepository;
  AreYouReadyBloc(this.civilDefenceRepository)
      : super(const FetchingAreYouReadyState()) {
    on<FetchAreYouReadyEvent>(_fetchAreYouReady);
  }

  void fetchAreYouReady(
    String baseUrl,
  ) =>
      add(FetchAreYouReadyEvent(baseUrl));

  FutureOr<void> _fetchAreYouReady(
      FetchAreYouReadyEvent event, Emitter<AreYouReadyState> emit) async {
    emit(const FetchingAreYouReadyState());
    try {
      final response = await civilDefenceRepository
          .getCivilDefenceAreYouReady(event.baseUrl);
      emit(FetchedAreYouReadyStateState(response));
    } catch (error) {
      emit(const ErrorAreYouReadyStateState());
    }
  }
}
