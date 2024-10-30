import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/position_utils.dart';
import 'package:municipium/utils/secure_storage.dart';

part 'municipality_url_state.dart';

class MunicipalityUrlCubit extends HydratedCubit<MunicipalityUrlState> {
  final SecureStorage secureStorage;
  final String baseUrl;
  MunicipalityUrlCubit({required this.secureStorage, required this.baseUrl})
      : super(MunicipalityUrlState());

  Future<void> fetchMunicipalityInStorage(String baseUrl) async {
    try {
      emit(MunicipalityUrlLoading());
      final municipality =
          await secureStorage.getMunicipalityObjectFromStorage();
      if (municipality != null) {
        final baseUrlEnv = 'https://${municipality.subdomain}/api/v2/';
        emit(MunicipalityUrlLoaded(baseUrlEnv));
      } else {
        emit(MunicipalityUrlEmpty());
      }
    } catch (e) {
      print(e);
      emit(MunicipalityUrlEmpty());
    }
  }

  void changeEnvironnement(BaseUrlType type) {
    emit(MunicipalityUrlLoading());
    switch (type) {
      case BaseUrlType.prod:
        emit(MunicipaltyEnvironnementChanging(MunicipiumUtility.BASEURL_PROD));
      case BaseUrlType.staging:
        emit(MunicipaltyEnvironnementChanging(
            MunicipiumUtility.BASEURL_STAGING));
    }
  }

  @override
  MunicipalityUrlState fromJson(Map<String, dynamic> json) {
    final baseUrl = json['baseUrl'] as String?;
    final isChanging = json['isChanging'] as bool? ?? false;

    if (isChanging && baseUrl != null) {
      return MunicipaltyEnvironnementChanging(baseUrl);
    } else if (baseUrl != null) {
      return MunicipalityUrlLoaded(baseUrl);
    } else {
      return MunicipalityUrlEmpty();
    }
  }

  @override
  Map<String, dynamic>? toJson(MunicipalityUrlState state) {
    if (state is MunicipalityUrlLoaded) {
      return {'baseUrl': state.baseUrl, 'isChanging': false};
    } else if (state is MunicipaltyEnvironnementChanging) {
      return {'baseUrl': state.baseUrl, 'isChanging': true};
    }
    return null;
  }
}
