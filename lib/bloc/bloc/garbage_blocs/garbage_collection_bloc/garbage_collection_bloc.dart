import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/garbage/garbage_collection.dart';
import 'package:municipium/repositories/garbage_repository.dart';

part 'garbage_collection_event.dart';
part 'garbage_collection_state.dart';

class GarbageCollectionBloc 
    extends Bloc<GarbageCollectionEvent, GarbageCollectionState> {
  final GarbageRepository garbageCollectionRepository;

  GarbageCollectionBloc({required this.garbageCollectionRepository})
      : super(const FetchingGarbageCollectionState()) {
    on<FetchGarbageCollectionEvent>(_fetchGarbageCollection);
  }

  void fetchGarbageCollection(String baseUrl) =>
      add(FetchGarbageCollectionEvent(baseUrl));

  FutureOr<void> _fetchGarbageCollection(
      FetchGarbageCollectionEvent event,
      Emitter<GarbageCollectionState> emit) async {
    emit(const FetchingGarbageCollectionState());
    try {
      final garbageCollection = await garbageCollectionRepository
          .getGarbageCollection(event.baseUrl);
      emit(FetchedGarbageCollectionState(garbageCollection));
    } catch (error) {
      emit(const ErrorGarbageCollectionState());
    }
  }


  
}