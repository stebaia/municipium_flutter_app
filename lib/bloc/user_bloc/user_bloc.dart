import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/user/idp_model.dart';
import 'package:municipium/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(const FetchingListIdpState()) {
    on<FetchListIdpEvent>(_fetchListIdp);
  }

  void fetchListIdp() => add(const FetchListIdpEvent());

  FutureOr<void> _fetchListIdp(FetchListIdpEvent event, Emitter<UserState> emit) async {
    emit(const FetchingListIdpState());
    try {
      final listIdp = await userRepository.getIdps();
      if(listIdp.isNotEmpty) {
        emit(FetchedListIdpState(listIdp));
      }else {
        emit(const NoListIdpState());
      }  
    }catch (e) {
      emit(const NoListIdpState());
    }
  }
}
