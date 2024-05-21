import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class MunicipiumUtility {
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
}
