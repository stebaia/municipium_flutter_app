part of 'garbage_collection_bloc.dart';

abstract class GarbageCollectionState extends Equatable {
  const GarbageCollectionState();

  @override
  List<Object> get props => [];
}

class FetchingGarbageCollectionState extends GarbageCollectionState {
  const FetchingGarbageCollectionState();
}

class FetchedGarbageCollectionState extends GarbageCollectionState {
  final GarbageCollection garbageCollection;
  const FetchedGarbageCollectionState(this.garbageCollection);

  @override
  List<Object> get props => [garbageCollection];
}

class ErrorGarbageCollectionState extends GarbageCollectionState {
  const ErrorGarbageCollectionState();
}