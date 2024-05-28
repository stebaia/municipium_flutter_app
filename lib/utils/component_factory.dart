import 'dart:io';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/ui/components/bordered_textfield.dart';
import 'package:municipium/ui/components/custom_row.dart';
import 'package:municipium/ui/components/horizzontal_gallery.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';

class ComponentFactory {
  static Widget createCheckbox(bool value, Widget title,
      {Function(bool? value)? onChanged}) {
    return Row(
      children: [
        Checkbox(
            value: value,
            activeColor: ThemeHelper.blueMunicipium,
            onChanged: ((value) {
              if (onChanged != null) {
                onChanged(value);
              }
            })),
        const SizedBox(
          width: 8,
        ),
        title
      ],
    );
  }

  static Widget checkAndCreateMultiRow(String? stringToCheck, String? title,
      {IconData? icon, Function()? tap}) {
    return stringToCheck != null && stringToCheck.isNotEmpty
        ? GestureDetector(
            onTap: tap,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon != null ? Icon(icon) : Container(),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text(
                                      MunicipiumUtility.removeHtmlTags(
                                          title ?? ''),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13))),
                              const SizedBox(
                                width: 24,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text(
                                      MunicipiumUtility.removeHtmlTags(
                                          stringToCheck),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13))),
                              const SizedBox(
                                width: 24,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  static Widget checkAndCreateRow(
      String? stringToCheck, IconData icon, Function()? tap) {
    return stringToCheck != null && stringToCheck.isNotEmpty
        ? CustomRow(title: stringToCheck, icon: icon, tap: tap)
        : Container();
  }

  static Widget getBorderedTextField(
      {String? title,
      IconButton? customIcon,
      String? placeHolder,
      Function(String)? onChanged,
      double? height,
      String? value,
      TextInputType? keyboardType}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              (title ?? placeHolder ?? '').toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  letterSpacing: -0.4),
            ),
            const SizedBox()
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        BorderedTextfield(
          title: title,
          customIcon: customIcon,
          placeHolder: placeHolder,
          onChanged: onChanged,
          height: height,
          value: value,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}
