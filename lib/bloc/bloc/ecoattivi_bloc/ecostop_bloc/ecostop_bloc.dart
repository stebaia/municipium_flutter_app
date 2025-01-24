import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecostop.dart';
import 'package:municipium/repositories/ecoattivi_repository.dart';

part 'ecostop_event.dart';
part 'ecostop_state.dart';

class EcostopBloc extends Bloc<EcostopEvent, EcostopState> {
  final EcoattiviRepository ecoattiviRepository;

  EcostopBloc({required this.ecoattiviRepository})
      : super(const FetchingEcostopState()) {
    on<FetchEcostopEvent>(_fetchEcostopList);
  }

  void fetchEcostopList(String baseUrl, String token, String guid) =>
      add(FetchEcostopEvent(baseUrl, token, guid));

  FutureOr<void> _fetchEcostopList(
      FetchEcostopEvent fetchEcostopEvent, Emitter<EcostopState> emit) async {
    emit(const FetchingEcostopState());
    try {
      final ecostopList = await ecoattiviRepository.getEcostops(
          baseUrl: fetchEcostopEvent.baseUrl,
          token: fetchEcostopEvent.token,
          guid: fetchEcostopEvent.guid);
      if (ecostopList != null) {
        if (ecostopList.isNotEmpty) {
          emit(FetchedEcostopState(ecostopList));
        } else {
          emit(const NoEcostopState());
        }
      } else {
        emit(const ErrorEcostopState());
      }
    } catch (error) {
      emit(const ErrorEcostopState());
    }
  }
}
