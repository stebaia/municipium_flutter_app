import 'package:flutter_bloc/flutter_bloc.dart';


class MunicipalityIdBloc extends Cubit<int> {
  MunicipalityIdBloc() : super(0); 

  void add(int id) => emit(id);
  void cancel() => emit(0);
}