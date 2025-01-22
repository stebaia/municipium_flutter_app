part of 'garbage_collection_bloc.dart';

abstract class GarbageCollectionEvent extends Equatable {
  const GarbageCollectionEvent();

  @override
  List<Object> get props => [];
}

class FetchGarbageCollectionEvent extends GarbageCollectionEvent {
  final String baseUrl;
  const FetchGarbageCollectionEvent(this.baseUrl);

  @override
  List<Object> get props => [baseUrl];
}


