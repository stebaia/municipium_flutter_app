import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  static Widget checkAndCreateRow(
      String? stringToCheck, IconData icon, Function()? tap) {
    return stringToCheck != null
        ? GestureDetector(
            onTap: tap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Text(stringToCheck,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13))),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
          )
        : Container();
  }
}
