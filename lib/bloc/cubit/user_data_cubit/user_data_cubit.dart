import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:municipium/model/user/user_spid_model.dart';

part 'user_data_state.dart';

class UserDataCubit extends HydratedCubit<SpidUserModel?> {
  UserDataCubit() : super(null);

  void auth(SpidUserModel spidUserModel) => emit(spidUserModel);
  void delete() => emit(null);

  @override
  SpidUserModel? fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return SpidUserModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SpidUserModel? state) {
    if (state == null) return null;
    return state.toJson();
  }
}