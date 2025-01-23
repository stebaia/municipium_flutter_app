import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/repositories/user_repository.dart';

part 'request_info_event.dart';
part 'request_info_state.dart';

class RequestInfoBloc extends Bloc<RequestInfoEvent, RequestInfoState> {
  final UserRepository userRepository;

  RequestInfoBloc({required this.userRepository})
      : super(const FetchingInfoState()) {
    on<UserRequestInfoEvent>(_getInfo);
  }

  void getInfo(String baseUrl, String info) =>
      add(UserRequestInfoEvent(baseUrl: baseUrl, info: info));

  Future<void> _getInfo(
      UserRequestInfoEvent event, Emitter<RequestInfoState> emit) async {
    emit(const FetchingInfoState());
    try {
      final desc = await userRepository.getInfo(event.baseUrl, event.info);
      emit(FetchedInfoState(desc));
    } catch (e) {
      emit(ErrorFetchedInfoState(e.toString()));
    }
  }
}
