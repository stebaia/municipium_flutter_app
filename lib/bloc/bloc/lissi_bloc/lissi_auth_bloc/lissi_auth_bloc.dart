import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/repositories/lissi_repository.dart';

part 'lissi_auth_event.dart';
part 'lissi_auth_state.dart';

class LissiAuthBloc extends Bloc<LissiAuthEvent, LissiAuthState> {
  final LissiRepository lissiRepository;

  LissiAuthBloc({required this.lissiRepository}) 
      : super(const FetchingLissiTokenState()) {
    on<FetchLissiTokenEvent>(_fetchLissiToken);
  }

  void fetchLissiToken() => add(const FetchLissiTokenEvent());

  FutureOr<void> _fetchLissiToken(
      FetchLissiTokenEvent event, 
      Emitter<LissiAuthState> emit) async {
    emit(const FetchingLissiTokenState());
    try {
      await lissiRepository.getAuthToken();
      final token = await lissiRepository.getLissiTokenKeyFromStorage();
      
      if (token != null) {
        emit(FetchedLissiTokenState(token));
      } else {
        emit(const ErrorLissiTokenState());
      }
    } catch (error) {
      emit(const ErrorLissiTokenState());
    }
  }
}