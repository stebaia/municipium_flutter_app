import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:municipium/model/municipality.dart';

class MunicipalityStoredCubit extends HydratedCubit<Municipality?> {
  MunicipalityStoredCubit() : super(null);

  // Metodo per aggiornare lo stato di Municipality
  void updateMunicipality(Municipality municipality) {
    emit(municipality); // Aggiorna lo stato e lo salva
  }

  @override
  Municipality? fromJson(Map<String, dynamic> json) {
    // Usa il costruttore da JSON di Municipality per deserializzare i dati
    return Municipality.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(Municipality? state) {
    // Serializza lo stato solo se non è null
    return state?.toJson();
  }
}