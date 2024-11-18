import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:municipium/utils/municipium_utility.dart';

class BaseUrlNotifier extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  String _baseUrl =  MunicipiumUtility.BASEURL_STAGING;
  String _baseUrlBe = MunicipiumUtility.BE_URL_STAGING;
  String _baseUrlMmc = MunicipiumUtility.MMC_URL_STAG;

  BaseUrlNotifier();

  bool isInitialized = false;

  String get baseUrl => _baseUrl;
  String get baseUrlBe => _baseUrlBe;
  String get baseUrlMmc => _baseUrlMmc;

  Future<void> initializeBaseUrl() async {
    final storedUrl = await _storage.read(key: MunicipiumUtility.BASEURL_KEY);
    final storedUrlBe = await _storage.read(key: MunicipiumUtility.BE_URL_KEY);
    final storedUrlMmc = await _storage.read(key: MunicipiumUtility.MMC_URL_KEY);
    _baseUrl = storedUrl ?? MunicipiumUtility.BASEURL_STAGING;
    _baseUrlBe = storedUrlBe ?? MunicipiumUtility.BE_URL_STAGING;
    _baseUrlMmc = storedUrlMmc ?? MunicipiumUtility.MMC_URL_STAG;
    isInitialized = true;
    notifyListeners();
  }

  // Metodo per aggiornare il baseUrl
  Future<void> updateBaseUrl(String url) async {
    _storage.write(key: MunicipiumUtility.BASEURL_KEY, value: url);
    _baseUrl = url;
    notifyListeners();
  }
}
