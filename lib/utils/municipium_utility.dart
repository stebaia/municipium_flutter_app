import 'dart:io';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class MunicipiumUtility {

  static String BASEURL_PROD = 'https://cloud.municipiumapp.it/api/v2/';

  static String BASEURL_STAGING = 'https://staging.municipiumapp.it/api/v2/';

  static String getDefaultImageUrl() {
    return 'https://cloud.municipiumapp.it/s3/0/media/images/events-default-squared.jpg';
  }

  static String convertDate(String dateString, String endFormat) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat(endFormat).format(date);
    return formattedDate;
  }

  static void launch(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchMapUrl(String address) async {
    // Codifica l'indirizzo per l'URL
    String encodedAddress = Uri.encodeFull(address);
    // Costruisce l'URL per Google Maps
    String url =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> requestGalleryPermission(Function() method) async {
    final PermissionStatus status = await Permission.photos.request();
    if (status.isGranted) {
      // Se i permessi sono stati concessi, puoi accedere alla galleria delle immagini
      method();
    } else {
      // Se l'utente ha negato i permessi, mostra un messaggio o gestisci di conseguenza
    }
  }

  static bool isValidEmail(String email) {
    // Definisci la RegExp per l'email
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );

    // Verifica se l'email corrisponde alla RegExp
    return emailRegExp.hasMatch(email);
  }

  static String removeHtmlTags(String htmlString) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return HtmlUnescape().convert(htmlString.replaceAll(exp, ''));
  }
}

class MunicipiumAPIV3 {
  static const String TAG = 'MunicipiumAPIV3';
  static String HTTPS_PROTOCOL = AppInfo().getTipo() == AppInfoType.DEMO ? 'http://' : 'https://';

  // DEVICE APIs
  static const String DEVICES = '/devices';
  static const String MUNICIPALITIES_SUBSCRIPTIONS = '/municipality-subscriptions';
  static const String GARBAGE_SUBSCRIPTIONS = '/garbage-subscriptions';
  static const String PRIMARY = '/primary';

  static String getDevicesURL() {
    return HTTPS_PROTOCOL + getEnvUrl() + DEVICES;
  }

  static String getDeviceURL(String udid) {
    return HTTPS_PROTOCOL + getEnvUrl() + DEVICES + '/$udid';
  }

  static String getGarbageSubscriptionsURL() {
    return HTTPS_PROTOCOL + getEnvUrl() + GARBAGE_SUBSCRIPTIONS;
  }

  static String getGarbageSubscriptionURL(int garbageSubscriptionId) {
    return HTTPS_PROTOCOL + getEnvUrl() + GARBAGE_SUBSCRIPTIONS + '/$garbageSubscriptionId';
  }

  static String getGarbageSubscriptionsOfDevice(String udid) {
    return getDeviceURL(udid) + GARBAGE_SUBSCRIPTIONS;
  }

  static String getGarbageSubscriptionOfDevice(String udid, int garbageSubscriptionId) {
    return getDeviceURL(udid) + GARBAGE_SUBSCRIPTIONS + '/$garbageSubscriptionId';
  }

  static String getMunicipalitiesSubscriptionsURL() {
    return HTTPS_PROTOCOL + getEnvUrl() + MUNICIPALITIES_SUBSCRIPTIONS;
  }

  static String getMunicipalitiesSubscriptionsOfDevice(String udid) {
    return getDeviceURL(udid) + MUNICIPALITIES_SUBSCRIPTIONS;
  }

  static String getMunicipalitiesSubscriptionOfDevice(String udid, int municipalityId) {
    return getDeviceURL(udid) + MUNICIPALITIES_SUBSCRIPTIONS + '/$municipalityId';
  }

  static String getPrimaryMunicipality(String udid) {
    return HTTPS_PROTOCOL + getEnvUrl() + DEVICES + '/$udid' + MUNICIPALITIES_SUBSCRIPTIONS + PRIMARY;
  }

  static String getEnvUrl() {
    return Environment.getApiUrl();
  }

  static String addParamsToRequest(String url) {
    if (!url.contains('?')) {
      return url + '?' + RequestFields.LANGUAGES + '=' +
          (Locale.current.languageCode == 'en' ? Locale.current.languageCode : Locale.current.languageCode + ',en');
    } else {
      return url + '&' + RequestFields.LANGUAGES + '=' +
          (Locale.current.languageCode == 'en' ? Locale.current.languageCode : Locale.current.languageCode + ',en');
    }
  }
}

class AppInfo {
  AppInfoType getTipo() {
    // Dummy implementation
    return AppInfoType.PRODUCTION;
  }
}

enum AppInfoType {
  DEMO,
  PRODUCTION,
}

class Environment {
  static String getApiUrl() {
    // Dummy implementation
    return 'api.municipiumapp.it';
  }
}

class RequestFields {
  static const String LANGUAGES = 'languages';
}

class Locale {
  static Locale current = Locale('en');

  final String languageCode;

  Locale(this.languageCode);
}