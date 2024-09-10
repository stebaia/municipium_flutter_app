import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/pnrr/body_pnrr_response.dart';
import 'package:municipium/repositories/pnrr_service_repository.dart';

part 'pnrr_body_event.dart';
part 'pnrr_body_state.dart';

class PnrrBodyBloc extends Bloc<PnrrBodyEvent, PnrrBodyState> {
  PnrrServiceRepository servicesRepository;

  PnrrBodyBloc({required this.servicesRepository})
      : super(const FetchingPnrrBodyState()) {
    on<FetchPnrrBodyEvent>(_fetchBodiesResponse);
  }

  void fetchBodiesPnrr(String type, int id) =>
      add(FetchPnrrBodyEvent(type: type, id: id));

  FutureOr<void> _fetchBodiesResponse(FetchPnrrBodyEvent fetchPnrrBodyEvent,
      Emitter<PnrrBodyState> emit) async {
    emit(const FetchingPnrrBodyState());
    try {
      final bodyResponse = await servicesRepository.getBodyPnrrResponse(
          fetchPnrrBodyEvent.type, fetchPnrrBodyEvent.id);
      if (bodyResponse.body != null && bodyResponse.body!.isNotEmpty) {
        emit(FetchedPnrrBodyState(bodyResponse));
      } else {
        emit(const NoPnrrBodyState());
      }
    } catch (error) {
      emit(const ErrorPnrrBodyState());
    }
  }
}
