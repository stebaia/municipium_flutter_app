import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/dto/post_issue_dto.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:image/image.dart' as img;

class MunicipiumUtility {
  static String BASEURL_PROD = 'https://cloud.municipiumapp.it/api/v2/';

  static String BASEURL_STAGING = 'https://staging.municipiumapp.it/api/v2/';

  static String getDefaultImageUrl() {
    return 'https://cloud.municipiumapp.it/s3/0/media/images/events-default-squared.jpg';
  }


  static String getLastDayOfMonth() {
    final now = DateTime.now();
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    return DateFormat('yyyy-MM-dd').format(lastDayOfMonth);
  }

  static String getDateFiveDaysAgo() {
    final fiveDaysAgo = DateTime.now().subtract(const Duration(days: 5));
    return DateFormat('yyyy-MM-dd').format(fiveDaysAgo);
  }

  static String getDatePlusThirtyDays() {
    final datePlusThirtyDays = DateTime.now().add(const Duration(days: 30));
    return DateFormat('yyyy-MM-dd').format(datePlusThirtyDays);
  }

  static String getFirstDayOfMonth() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    return DateFormat('yyyy-MM-dd').format(firstDayOfMonth);
  }

  static String getCurrentDay() {
    final now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now);
  }

  static String getFormatDayFromDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return date.isAtSameMomentAs(DateTime.now())
                            ? 'oggi'
                            : date.isAtSameMomentAs(DateTime.now().subtract(Duration(days: 1)))
                                ? 'ieri'
                                : date.isAtSameMomentAs(DateTime.now().add(Duration(days: 1)))
                                    ? 'domani'
                                    : DateFormat('EEE, d MMMM').format(date);
  }

  static String convertDate(String dateString, String endFormat,
      {bool? todayYesterdayIncluded, String? startFormat, bool? withHours}) {
    DateTime date = startFormat != null
        ? DateFormat(startFormat).parse(dateString)
        : DateTime.parse(dateString);
    if (todayYesterdayIncluded != null && todayYesterdayIncluded) {
      final now = DateTime.now();
      final difference = now.difference(date).inDays;
      final timeFormat = DateFormat('HH:mm', 'it');
      if (difference == 0) {
        return 'oggi ${withHours ?? false ? timeFormat.format(date) : ''}';
      } else if (difference == 1) {
        return 'ieri ${withHours ?? false ? timeFormat.format(date) : ''}';
      } else {
        return DateFormat(endFormat, 'it').format(date);
      }
    } else {
      String formattedDate = DateFormat(endFormat, 'it').format(date);
      return formattedDate;
    }
  }

  static String getDateForName() {
    DateTime date = DateTime.now();
    String formattedDate =
        DateFormat('yyyy-MM-dd\'T\'HH:mm:ssZ', 'it').format(date);
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

  static Future<List<String>> convertToBase64(List<XFile> list) async {
    List<String> base64List = [];
    for (XFile file in list) {
      File imageFile = File(file.path);
      Uint8List imageBytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(imageBytes);
      if (image == null) {
        throw Exception("Impossibile decodificare l'immagine");
      }
      img.Image? resized = img.copyResize(image, width: 800);
      List<int> resizedImageBytes = img.encodePng(resized);
      String base64 = base64Encode(resizedImageBytes)
          /*.replaceAll('+', '-')
          .replaceAll('/', '_')
          .replaceAll('=', '')*/
          ;
      base64List.add(base64);
    }
    return base64List;
  }

  static Future<XFile> downloadFile(String url) async {
    // Crea un client Dio per effettuare la richiesta HTTP
    Dio dio = Dio();

    try {
      // Esegui la richiesta HTTP per scaricare il file
      Response response = await dio.get(url,
          options: Options(responseType: ResponseType.bytes));

      // Ottieni il percorso della directory temporanea
      Directory tempDir = await getTemporaryDirectory();

      // Crea il percorso completo del file nella directory temporanea
      String filePath = '${tempDir.path}/${Uri.parse(url).pathSegments.last}';

      // Scrivi i byte della risposta nel file
      File file = File(filePath);
      await file.writeAsBytes(response.data as List<int>);

      // Restituisci l'oggetto XFile del file scaricato
      return XFile(filePath);
    } catch (e) {
      print('Errore durante il download del file: $e');
      throw e; // Gestisci l'errore appropriatamente nella tua applicazione
    }
  }

  static Future<List<XFile>> downloadFilesFromUrls(List<String> urls) async {
    List<XFile> xFiles = [];

    // Itera attraverso ogni URL e scarica il file corrispondente
    for (String url in urls) {
      try {
        XFile xFile = await downloadFile(url);
        xFiles.add(xFile);
      } catch (e) {
        print('Errore durante il download del file da $url: $e');
        // Gestisci l'errore come preferisci (es. salta questo URL, mostra un messaggio d'errore, ecc.)
      }
    }

    return xFiles;
  }

  static Future<PostIssueDto> createPostIssue(
      ProgressIssue issue, Municipality municipality) async {
    PostIssueDto issueDto = PostIssueDto();
    IssueContentDto contentDto = IssueContentDto();
    contentDto.municipalityId = municipality.muninicipalityId;
    contentDto.municipalityName = municipality.municipalityName;
    contentDto.latitude = issue.latitude;
    contentDto.longitude = issue.longitude;
    contentDto.address = issue.address;
    contentDto.phone = issue.phone;
    contentDto.surname = issue.surname;
    contentDto.email = issue.email;
    contentDto.issueCategoryId =
        issue.issueSubCategoryId ?? issue.issueCategoryId;
    if (issue.imageList != null && (issue.imageList ?? []).isNotEmpty) {
      List<String> listBase64 = [];
      listBase64 = await MunicipiumUtility.convertToBase64(issue.imageList!);
      ImageIssueDto image1 = ImageIssueDto();
      image1.file = listBase64[0];
      DateTime now = DateTime.now();
      String name = DateFormat().format(now);
      image1.filename = '$name.png';
      image1.originalFilename = name;
      contentDto.image1 = image1;
      if (listBase64.length > 1) {
        ImageIssueDto image2 = ImageIssueDto();
        image2.file = listBase64[1];
        DateTime now = DateTime.now();
        String name = DateFormat().format(now);
        image2.filename = '$name.png';
        image2.originalFilename = name;
        contentDto.image2 = image2;
      }
      if (listBase64.length > 2) {
        ImageIssueDto image3 = ImageIssueDto();
        image3.file = listBase64[2];
        DateTime now = DateTime.now();
        String name = DateFormat().format(now);
        image3.filename = '$name.png';
        image3.originalFilename = name;
        contentDto.image3 = image3;
      }
      if (listBase64.length > 3) {
        ImageIssueDto image4 = ImageIssueDto();
        image4.file = listBase64[3];
        DateTime now = DateTime.now();
        String name = DateFormat().format(now);
        image4.filename = '$name.png';
        image4.originalFilename = name;
        contentDto.image4 = image4;
      }
    }
    issueDto.issue = contentDto;
    issueDto.udid = '';

    issueDto.userAgent = await MunicipiumUtility.createUserAgent();
    return issueDto;
  }

  static Future<String> createUserAgent() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final deviceInfoPlugin = DeviceInfoPlugin();
    String info = '';

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        info = "${packageInfo.appName} ${packageInfo.version} "
            "${androidInfo.model} ${androidInfo.version.release} "
            "Darwin/Android ${androidInfo.version.sdkInt}";
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        info = "${packageInfo.appName} ${packageInfo.version} "
            "${iosInfo.utsname.machine} ${iosInfo.systemVersion} "
            "${iosInfo.utsname.version} "
            "Darwin/${iosInfo.utsname.release}";
      }
    } catch (e) {
      info = 'Failed to get info: $e';
    }
    return info;
  }
}

class MunicipiumAPIV3 {
  static const String TAG = 'MunicipiumAPIV3';
  static String HTTPS_PROTOCOL =
      AppInfo().getTipo() == AppInfoType.DEMO ? 'http://' : 'https://';

  // DEVICE APIs
  static const String DEVICES = '/devices';
  static const String MUNICIPALITIES_SUBSCRIPTIONS =
      '/municipality-subscriptions';
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
    return HTTPS_PROTOCOL +
        getEnvUrl() +
        GARBAGE_SUBSCRIPTIONS +
        '/$garbageSubscriptionId';
  }

  static String getGarbageSubscriptionsOfDevice(String udid) {
    return getDeviceURL(udid) + GARBAGE_SUBSCRIPTIONS;
  }

  static String getGarbageSubscriptionOfDevice(
      String udid, int garbageSubscriptionId) {
    return getDeviceURL(udid) +
        GARBAGE_SUBSCRIPTIONS +
        '/$garbageSubscriptionId';
  }

  static String getMunicipalitiesSubscriptionsURL() {
    return HTTPS_PROTOCOL + getEnvUrl() + MUNICIPALITIES_SUBSCRIPTIONS;
  }

  static String getMunicipalitiesSubscriptionsOfDevice(String udid) {
    return getDeviceURL(udid) + MUNICIPALITIES_SUBSCRIPTIONS;
  }

  static String getMunicipalitiesSubscriptionOfDevice(
      String udid, int municipalityId) {
    return getDeviceURL(udid) +
        MUNICIPALITIES_SUBSCRIPTIONS +
        '/$municipalityId';
  }

  static String getPrimaryMunicipality(String udid) {
    return HTTPS_PROTOCOL +
        getEnvUrl() +
        DEVICES +
        '/$udid' +
        MUNICIPALITIES_SUBSCRIPTIONS +
        PRIMARY;
  }

  static String getEnvUrl() {
    return Environment.getApiUrl();
  }

  static String addParamsToRequest(String url) {
    if (!url.contains('?')) {
      return url +
          '?' +
          RequestFields.LANGUAGES +
          '=' +
          (Locale.current.languageCode == 'en'
              ? Locale.current.languageCode
              : Locale.current.languageCode + ',en');
    } else {
      return url +
          '&' +
          RequestFields.LANGUAGES +
          '=' +
          (Locale.current.languageCode == 'en'
              ? Locale.current.languageCode
              : Locale.current.languageCode + ',en');
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
