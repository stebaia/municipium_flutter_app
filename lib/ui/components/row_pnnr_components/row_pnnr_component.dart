import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:municipium/utils/municipium_utility.dart';
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

Widget buildCreditsRow(String title, String? content) {
  if (content != null && content.isNotEmpty) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(child: Text(MunicipiumUtility.removeHtmlTags(content))),
        ],
      ),
    );
  } else {
    return Container();
  }
}

Widget buildLinkBox(String title, List<String?>? children,
    {IconData? icon, List<VoidCallback?>? onPressed}) {
  if (children != null && children.isNotEmpty) {
    return Column(
      children: [
        Row(
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox()
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: children.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              final onPressedFunc = onPressed?[index];
              if (onPressedFunc != null) {
                onPressedFunc();
              }
            },
            child: Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(children[index] ?? '',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400)
                          //style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                    ),
                    const SizedBox(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(icon ?? Icons.arrow_forward_ios_outlined))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  } else {
    return Container();
  }
}

Widget buildDescriptionRow(String? title, String? description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            title ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox()
        ],
      ),
      const SizedBox(height: 4),
      Text(MunicipiumUtility.removeHtmlTags(description ?? ''),
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
    ],
  );
}
