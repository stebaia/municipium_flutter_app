import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PnnrUtils {
  static IconData getIconsFromContactPointPnnr(int type) {
    switch (type) {
      case 1:
        return CupertinoIcons.mail;
      case 2:
        return CupertinoIcons.phone;
      case 6:
        return FontAwesomeIcons.whatsapp;
      case 7:
        return FontAwesomeIcons.telegram;
      case 8:
        return FontAwesomeIcons.skype;
      default:
        return CupertinoIcons.person;
    }
  }

  static getUrlFromContactPointPnnr(int type, String url) {
    switch (type) {
      case 1:
        launchUrl(Uri.parse('mail:$url'));
        break;
      case 2:
        launchUrl(Uri.parse('tel:$url'));
        break;
      case 6:
        if (Platform.isAndroid) {
          // add the [https]
          launchUrl(Uri.parse(
              "https://wa.me/$url/?text=${Uri.parse('Contattami')}")); // new line
        } else {
          // add the [https]
          return launchUrl(Uri.parse(
              "https://api.whatsapp.com/send?phone=$url=${Uri.parse('Contattami')}")); // new line
        }
        break;

      case 7:
        launchUrl(Uri.parse("https://t.me/$url")); // new line

        break;

      default:
        launchUrl(Uri.parse(url));
        break;
    }
  }
}
