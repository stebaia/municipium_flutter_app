import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/utils/position_utils.dart';
import 'package:municipium/utils/secure_storage.dart';

part 'municipality_url_state.dart';

class MunicipalityUrlCubit extends Cubit<MunicipalityUrlState> {
  final SecureStorage secureStorage;
  final BaseUrlType baseUrl;
  MunicipalityUrlCubit({required this.secureStorage, required this.baseUrl}) : super(MunicipalityUrlState());

  

  Future<void> fetchMunicipalityInStorage() async {
    try {
      emit(MunicipalityUrlLoading());
      final municipality = await secureStorage.getMunicipalityObjectFromStorage();
      if(municipality != null) {
        final baseUrlEnv = 'https://${municipality.subdomain}/api/v2/';
        emit(MunicipalityUrlLoaded(baseUrlEnv));
      }else {
        emit(MunicipalityUrlEmpty());
      }
    }catch (e) {
      print(e);
      emit(MunicipalityUrlEmpty());
    }
  }
}
