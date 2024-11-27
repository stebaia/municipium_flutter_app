import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/civil_defence/civil_defence_list_informations.dart';
import 'package:municipium/repositories/civil_defence_repository.dart';

part 'civil_defence_info_event.dart';
part 'civil_defence_info_state.dart';

class CivilDefenceInfoBloc extends Bloc<CivilDefenceInformationsEvent, CivilDefenceInformationsState> {

  final CivilDefenceRepository civilDefenceRepository;
  
   CivilDefenceInfoBloc({required this.civilDefenceRepository})
      : super(const FetchingCivilDefenceInformationsState()) {
    on<FetchCivilDefenceInformationsEvent>(_fetchCivilDefenceInformations);
  }


  void fetchCivilDefenceInformations(String baseUrl) =>
      add(FetchCivilDefenceInformationsEvent(baseUrl));

  FutureOr<void> _fetchCivilDefenceInformations(
      FetchCivilDefenceInformationsEvent event,
      Emitter<CivilDefenceInformationsState> emit) async {
    emit(const FetchingCivilDefenceInformationsState());
    try {
      final civilDefenceInformations = await civilDefenceRepository
          .getCivilDefenceInformations(event.baseUrl);
      
      if (civilDefenceInformations.isNotEmpty) {
        emit(FetchedCivilDefenceInformationsState(civilDefenceInformations));
      } else {
        emit(const NoCivilDefenceInformationsState());
      }
    } catch (error) {
      emit(const ErrorCivilDefenceInformationsState());
    }
  }
}
