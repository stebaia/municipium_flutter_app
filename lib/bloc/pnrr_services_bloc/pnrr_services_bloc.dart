import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/model/pnrr/service_pnrr.dart';
import 'package:municipium/repositories/pnrr_service_repository.dart';

part 'pnrr_services_state.dart';
part 'pnrr_services_event.dart';

class PnrrServicesBloc extends Bloc<PnrrServiceEvent, PnrrServiceState> {
  PnrrServiceRepository servicesRepository;
  List<ServicePnrr> allServices = [];
  List<ServicePnrr> allServicesFiltered = [];
  bool isSearching = false;

  PnrrServicesBloc({required this.servicesRepository})
      : super(const FetchingPnrrServiceState()) {
    on<FetchPnrrServiceEvent>(_fetchServicesList);
    on<FilterPnrrServiceEvent>(_filterServicesList);
  }

  void fetchServicesPnrr(String type) => add(FetchPnrrServiceEvent(type: type));
  void filterServicesPnrr(String searchText) =>
      add(FilterPnrrServiceEvent(searchText));

  FutureOr<void> _fetchServicesList(
      FetchPnrrServiceEvent fetchPnrrServicesEvent,
      Emitter<PnrrServiceState> emit) async {
    emit(const FetchingPnrrServiceState());
    try {
      final newsItemsList = await servicesRepository
          .getServicesPnrrList(fetchPnrrServicesEvent.type);
      if (newsItemsList.isNotEmpty) {
        allServices.addAll(newsItemsList);
        emit(FetchedPnrrServiceState(allServices));
      } else {
        emit(const NoPnrrServiceState());
      }
    } catch (error) {
      emit(const ErrorPnrrServiceState());
    }
  }

  Future<void> _filterServicesList(
      FilterPnrrServiceEvent event, Emitter<PnrrServiceState> emit) async {
    // Aggiorna la lista filtrata in base al testo di ricerca
    allServicesFiltered = event.searchText != ''
        ? allServices
            .where((servicesItem) => (servicesItem.title ?? '')
                .toLowerCase()
                .contains(event.searchText.toLowerCase()))
            .toList()
        : allServices;
    emit(FetchedPnrrServiceState(allServicesFiltered));
  }
}
