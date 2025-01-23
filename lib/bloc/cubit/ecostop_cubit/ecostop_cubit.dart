import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/ecoattivi/ecostop_map_model.dart';

class EcostopCubit extends Cubit<EcostopMapModel> {
  EcostopCubit() : super(EcostopMapModel());

  void setListSectionVisible() {
    final model = state.copyWith(isListSection: true);
    emit(model);
  }

  void setMapSectionVisible() {
    final model = state.copyWith(isListSection: false);
    emit(model);
  }
}
