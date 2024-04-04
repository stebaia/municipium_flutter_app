import 'package:flutter_bloc/flutter_bloc.dart';


enum VisibilityState { visible, invisible }


class VisibilityCubit extends Cubit<VisibilityState> {
  VisibilityCubit() : super(VisibilityState.invisible); 

  void show() => emit(VisibilityState.visible);
  void hide() => emit(VisibilityState.invisible);
}