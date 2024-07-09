import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:municipium/utils/position_utils.dart';

part 'base_url_state.dart';

class BaseUrlCubit extends HydratedCubit<BaseUrlState> {
  BaseUrlCubit() : super(const BaseUrlState());
  
  @override
  BaseUrlState? fromJson(Map<String, dynamic> json) => BaseUrlState(BaseUrlType.values.byName(json['baseUrl'] as String));
  
   @override
  Map<String, dynamic>? toJson(BaseUrlState state) => {'baseUrl': state.baseUrlType.name};

  void setBaseUrl(BaseUrlType? baseUrl) => emit(BaseUrlState(baseUrl ?? BaseUrlType.prod));

  

}
