import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/repositories/mappers/municipality_secure_mapper.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  final String _oneSignalKey = "ONE_SIGNAL_KEY";

  final String _municipalityKey = "MUNINICIPALITY_KEY";

  final String _deviceKey = "DEVICE_KEY";

  Future setMunicipalityKeyInStorage(String municipality) async {
    await storage.write(key: _municipalityKey, value: municipality);
  }

  Future setDeviceKeyInStorage(String device) async {
    await storage.write(key: _deviceKey, value: device);
  }

  Future<String?> getDeviceFromStorage() async {
    try {
      return await storage.read(key: _deviceKey);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteMunicipalitylKeySecureData() async {
    await storage.delete(
      key: _municipalityKey,
    );
  }

  Future<String?> getMunicipalityFromStorage() async {
    try {
      return await storage.read(key: _municipalityKey);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Municipality?> getMunicipalityObjectFromStorage() async {
    try {
      final json = await storage.read(key: _municipalityKey);
      final mapper = MunicipalitySecureMapper();

      if (json != null) {
        Municipality municipality = mapper.to(json);
        return municipality;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future setOneSignalKeyInStorage(String key) async {
    await storage.write(key: _oneSignalKey, value: key);
  }

  Future<void> deleteOneSignalKeySecureData() async {
    await storage.delete(
      key: _oneSignalKey,
    );
  }

  Future<String?> getOneSignalKeyFromStorage() async {
    try {
      return await storage.read(key: _oneSignalKey);
    } catch (e) {
      throw Exception(e);
    }
  }

  void deleteAll() {
    deleteOneSignalKeySecureData();
    deleteMunicipalitylKeySecureData();
  }
}
