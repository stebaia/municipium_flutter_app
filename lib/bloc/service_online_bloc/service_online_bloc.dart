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
  ServiceOnlineBloc({required this.onlineServiceRepository})
      : super(const TryServiceOnlineState()) {
        on<FetchServiceListEvent> (_fetchServiceList);
      }

  void fetchServiceList() => add(FetchServiceListEvent());

  FutureOr<void> _fetchServiceList(
      FetchServiceListEvent event, Emitter<ServiceOnlineState> emit) async {
    try {
      emit(const TryServiceOnlineState());
      final serviceOnline = await onlineServiceRepository.getListOnlineService();
      emit(FetchedServiceOnlineState(serviceOnline));
    } catch (error) {
      emit(const ErrorServiceOnlineState());
    }
  }
}
