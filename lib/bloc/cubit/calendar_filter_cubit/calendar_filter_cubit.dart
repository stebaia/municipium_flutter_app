import 'package:bloc/bloc.dart';

class FilterCubit extends Cubit<Set<FilterType>> {
  FilterCubit() : super({}); // Inizialmente nessun filtro attivo
  
  void toggleFilter(FilterType filter) {
    final updatedFilters = Set<FilterType>.from(state);
    if (updatedFilters.contains(filter)) {
      updatedFilters.remove(filter); // Rimuovi il filtro se è già attivo
    } else {
      updatedFilters.add(filter); // Aggiungi il filtro se non è attivo
    }
    emit(updatedFilters); // Aggiorna lo stato con i nuovi filtri
  }

  void clearFilters() {
    emit({}); // Cancella tutti i filtri
  }

 

  void applyFilters() {
    // Eventuale logica per l'applicazione dei filtri (aggiornamento lista eventi, ecc.)
    emit(state);
  }
}

enum FilterType { rifiuti, news, eventi, emergenze, prenotazioni }