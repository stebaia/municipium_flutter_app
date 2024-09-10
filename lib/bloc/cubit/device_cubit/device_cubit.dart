import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/repositories/municipality_repository.dart';


class DeviceCubit extends Cubit<DeviceBe?> {
  DeviceCubit(this.municipalityRepository) : super(null);
  MunicipalityRepository municipalityRepository;

  Future<DeviceBe?> getDeviceBeFromStorage() async {
    final deviceBe = await municipalityRepository.getCurrentDevice();
    emit(deviceBe);
    return deviceBe;
  }
}
