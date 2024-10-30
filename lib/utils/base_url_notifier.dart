import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:municipium/utils/municipium_utility.dart';

class BaseUrlNotifier extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  late String _baseUrl;
  late String _baseUrlBe;
  late String _baseUrlMmc;

  BaseUrlNotifier();

  String get baseUrl => _baseUrl;
  String get baseUrlBe => _baseUrlBe;
  String get baseUrlMmc => _baseUrlMmc;

  Future<void> initializeBaseUrl() async {
    final storedUrl = await _storage.read(key: MunicipiumUtility.BASEURL_KEY);
    final storedUrlBe = await _storage.read(key: MunicipiumUtility.BE_URL_KEY);
    final storedUrlMmc =
        await _storage.read(key: MunicipiumUtility.MMC_URL_KEY);
    _baseUrl = storedUrl ?? MunicipiumUtility.BASEURL_STAGING;
    _baseUrlBe = storedUrlBe ?? MunicipiumUtility.BE_URL_STAGING;
    _baseUrlMmc = storedUrlMmc ?? MunicipiumUtility.MMC_URL_STAG;
  }

  // Metodo per aggiornare il baseUrl
  void updateBaseUrl(String url) {
    _storage.write(key: MunicipiumUtility.BASEURL_KEY, value: url);
    _baseUrl = url;
    notifyListeners();
  }
}
