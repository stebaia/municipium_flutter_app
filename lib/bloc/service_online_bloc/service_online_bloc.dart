import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/online_service/online_service.dart';
import 'package:municipium/repositories/online_service_repository.dart';
import 'package:municipium/services/network/api/online_service_service/online_service_service.dart';

part 'service_online_event.dart';
part 'service_online_state.dart';

class ServiceOnlineBloc extends Bloc<ServiceOnlineEvent, ServiceOnlineState> {
  final OnlineServiceRepository onlineServiceRepository;
  List<OnlineService> _allServices = [];

  ServiceOnlineBloc({required this.onlineServiceRepository})
      : super(const TryServiceOnlineState()) {
        on<FetchServiceListEvent> (_fetchServiceList);
        on<FilterServiceListEvent> (_filterServiceList);
      }

  void fetchServiceList() => add(const FetchServiceListEvent());

  void filterServiceList(String query) => add(FilterServiceListEvent(query));

  FutureOr<void> _fetchServiceList(
      FetchServiceListEvent event, Emitter<ServiceOnlineState> emit) async {
    try {
      emit(const TryServiceOnlineState());
      final serviceOnline = await onlineServiceRepository.getListOnlineService();
      _allServices.addAll(serviceOnline);
      emit(FetchedServiceOnlineState(serviceOnline));
    } catch (error) {
      emit(const ErrorServiceOnlineState());
    }
  }

  FutureOr<void> _filterServiceList(
      FilterServiceListEvent event, Emitter<ServiceOnlineState> emit) async {
    if (state is FetchedServiceOnlineState) {
      final filteredList = _allServices
          .where((service) =>
              service.name?.toLowerCase().contains(event.query.toLowerCase()) ??
              false)
          .toList();
      emit(FetchedServiceOnlineState(filteredList));
    }
  }
}
