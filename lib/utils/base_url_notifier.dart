import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/position_utils.dart';

class BaseUrlNotifier extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  String _baseUrl = MunicipiumUtility.BASEURL_STAGING;
  String _baseUrlBe = MunicipiumUtility.BE_URL_STAGING;
  String _baseUrlMmc = MunicipiumUtility.MMC_URL_STAG;
  String _baseUrlEcoattivi = MunicipiumUtility.ECOATTIVI_URL_STAGING;
  String _guidEcoattivi = MunicipiumUtility.ECOATTIVI_GUID_STAGING;

  BaseUrlNotifier();

  bool isInitialized = false;

  String get baseUrl => _baseUrl;
  String get baseUrlBe => _baseUrlBe;
  String get baseUrlMmc => _baseUrlMmc;
  String get baseUrlEcoattivi => _baseUrlEcoattivi;
  String get guidEcoattivi => _guidEcoattivi;

  Future<void> initializeBaseUrl(BaseUrlType type) async {
    final storedUrl = await _storage.read(key: MunicipiumUtility.BASEURL_KEY);
    final storedUrlBe = await _storage.read(key: MunicipiumUtility.BE_URL_KEY);
    final storedUrlMmc =
        await _storage.read(key: MunicipiumUtility.MMC_URL_KEY);
    final storedEcoattiviUrl =
        await _storage.read(key: MunicipiumUtility.ECOATTIVI_URL_KEY);
    final storedEcoattiviGuid =
        await _storage.read(key: MunicipiumUtility.ECOATTIVI_GUID_KEY);
    _baseUrl = storedUrl ??
        (type == BaseUrlType.staging
            ? MunicipiumUtility.BASEURL_STAGING
            : MunicipiumUtility.BASEURL_PROD);
    _baseUrlBe = storedUrlBe ??
        (type == BaseUrlType.staging
            ? MunicipiumUtility.BE_URL_STAGING
            : MunicipiumUtility.BE_URL_PROD);
    _baseUrlMmc = storedUrlMmc ??
        (type == BaseUrlType.staging
            ? MunicipiumUtility.MMC_URL_STAG
            : MunicipiumUtility.MMC_URL_PROD);
    _baseUrlEcoattivi = storedEcoattiviUrl ??
        (type == BaseUrlType.staging
            ? MunicipiumUtility.ECOATTIVI_URL_STAGING
            : MunicipiumUtility.ECOATTIVI_URL_PROD);
    _guidEcoattivi = storedEcoattiviGuid ??
        (type == BaseUrlType.staging
            ? MunicipiumUtility.ECOATTIVI_GUID_STAGING
            : MunicipiumUtility.ECOATTIVI_GUID_PROD);
    isInitialized = true;
    notifyListeners();
  }

  // Metodo per aggiornare il baseUrl
  Future<void> updateBaseUrl(String url) async {
    _storage.write(key: MunicipiumUtility.BASEURL_KEY, value: url);
    _baseUrl = url;
    notifyListeners();
  }

  Future<void> updateAllBaseUrls(BaseUrlType type) async {
    switch (type) {
      case BaseUrlType.prod:
        _storage.write(
            key: MunicipiumUtility.BASEURL_KEY,
            value: MunicipiumUtility.BASEURL_PROD);
        _baseUrl = MunicipiumUtility.BASEURL_PROD;
        _storage.write(
            key: MunicipiumUtility.BE_URL_KEY,
            value: MunicipiumUtility.BE_URL_PROD);
        _baseUrlBe = MunicipiumUtility.BE_URL_PROD;
        _storage.write(
            key: MunicipiumUtility.MMC_URL_KEY,
            value: MunicipiumUtility.MMC_URL_PROD);
        _baseUrlMmc = MunicipiumUtility.MMC_URL_PROD;
        _storage.write(
            key: MunicipiumUtility.ECOATTIVI_URL_KEY,
            value: MunicipiumUtility.ECOATTIVI_URL_PROD);
        _baseUrlEcoattivi = MunicipiumUtility.ECOATTIVI_URL_PROD;
        _storage.write(
            key: MunicipiumUtility.ECOATTIVI_GUID_KEY,
            value: MunicipiumUtility.ECOATTIVI_GUID_PROD);
        _guidEcoattivi = MunicipiumUtility.ECOATTIVI_GUID_PROD;
      case BaseUrlType.staging:
        _storage.write(
            key: MunicipiumUtility.BASEURL_KEY,
            value: MunicipiumUtility.BASEURL_STAGING);
        _baseUrl = MunicipiumUtility.BASEURL_STAGING;
        _storage.write(
            key: MunicipiumUtility.BE_URL_KEY,
            value: MunicipiumUtility.BE_URL_STAGING);
        _baseUrlBe = MunicipiumUtility.BE_URL_STAGING;
        _storage.write(
            key: MunicipiumUtility.MMC_URL_KEY,
            value: MunicipiumUtility.MMC_URL_STAG);
        _baseUrlMmc = MunicipiumUtility.MMC_URL_STAG;
        _storage.write(
            key: MunicipiumUtility.ECOATTIVI_URL_KEY,
            value: MunicipiumUtility.ECOATTIVI_URL_STAGING);
        _baseUrlEcoattivi = MunicipiumUtility.ECOATTIVI_URL_STAGING;
        _storage.write(
            key: MunicipiumUtility.ECOATTIVI_GUID_KEY,
            value: MunicipiumUtility.ECOATTIVI_GUID_STAGING);
        _guidEcoattivi = MunicipiumUtility.ECOATTIVI_GUID_STAGING;
    }

    notifyListeners();
  }
}
