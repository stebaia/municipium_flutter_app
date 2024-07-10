import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/ui/components/autocomplete_textfield.dart';
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
      Function(String)? onFieldSubmitted,
      double? height,
      String? value,
      TextInputType? keyboardType}) {
    TextEditingController controller = TextEditingController(text: value);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

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
          onFieldSubmitted: onFieldSubmitted,
          height: height,
          controller: controller,
          keyboardType: keyboardType,
        )
      ],
    );
  }

  static Widget getAutocompleteTextField(
      {String? title,
      IconButton? customIcon,
      String? placeHolder,
      Function(String)? onFieldSubmitted,
      double? height,
      String? value,
      TextInputType? keyboardType}) {
    TextEditingController controller = TextEditingController(text: value);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    String apiKey = Platform.isAndroid
        ? "AIzaSyDQiFkb2LQuyamAtqPf6W3ATjwsuNpEPtA"
        : "AIzaSyAU7KLScKSuOC94Kdvq_BnK3pmTaXu4vOk";
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
        /*GooglePlaceAutoCompleteTextField(
            textEditingController: controller,
            googleAPIKey: apiKey,
            inputDecoration: InputDecoration(),
            debounceTime: 800, // default 600 ms,
            countries: ["in", "fr"], // optional by default null is set
            isLatLngRequired:
                true, // if you required coordinates from place detail
            getPlaceDetailWithLatLng: (Prediction prediction) {
              // this method will return latlng with place detail
              print("placeDetails" + prediction.lng.toString());
            }, // this callback is called when isLatLngRequired is true
            itemClick: (Prediction prediction) {
              controller.text = prediction.description ?? '';
              controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: (prediction.description ?? '').length));
            },
            // if we want to make custom list item builder
            itemBuilder: (context, index, Prediction prediction) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(child: Text("${prediction.description ?? ""}"))
                  ],
                ),
              );
            })*/
        AutocompleteTextfield(
          title: title,
          customIcon: customIcon,
          placeHolder: placeHolder,
          onFieldSubmitted: onFieldSubmitted,
          height: height,
          controller: controller,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}
