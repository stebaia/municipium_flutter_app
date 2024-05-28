import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildRowElement(
    IconData iconData, String? text, void Function()? onTap) {
  if (text != null) {
    if (text.isNotEmpty) {
      return InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                Icon(iconData),
                const SizedBox(
                  width: 10,
                ),
                Flexible(child: Text(text)),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  } else {
    return Container();
  }
}

Widget buildRowElementLink(IconData iconData, String? text) {
  if (text != null) {
    if (text.isNotEmpty) {
      return Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Icon(iconData),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: InkWell(
                    child: Text(text),
                    onTap: () => launchUrl(Uri.parse(text)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      );
    } else {
      return Container();
    }
  } else {
    return Container();
  }
}
