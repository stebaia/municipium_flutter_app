import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  final String _oneSignalKey = "ONE_SIGNAL_KEY";

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
}
