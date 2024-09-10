import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:municipium/model/user/user_spid_model.dart';

part 'user_data_state.dart';

class UserDataCubit extends HydratedCubit<SpidUserModel> {
  UserDataCubit() : super(SpidUserModel());

  // Autentica l'utente emettendo il nuovo modello utente
  void auth(SpidUserModel spidUserModel) => emit(spidUserModel);

  // Cancella l'utente impostando lo stato a null
  void delete() => emit(SpidUserModel());

  @override
  SpidUserModel? fromJson(Map<String, dynamic> json) {
    // Torna null se il json è null, altrimenti deserializza l'oggetto
    return json == null ? null : SpidUserModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SpidUserModel? state) {
    // Torna null se lo stato è null (indica che non c'è nulla da salvare)
    return state?.toJson();
  }
}