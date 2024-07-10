import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:municipium/utils/theme_helper.dart';

class AutocompleteTextfield extends StatelessWidget {
  AutocompleteTextfield(
      {Key? key,
      this.controller,
      this.title,
      this.customIcon,
      this.placeHolder,
      this.onFieldSubmitted,
      this.height,
      this.value,
      this.keyboardType})
      : super(key: key);

  final TextEditingController? controller;
  String? title;
  IconButton? customIcon;
  String? placeHolder;
  Function(String)? onFieldSubmitted;
  double? height;
  String? value;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: ThemeHelper.lightGrey),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            suffixIcon: customIcon,
            hintText: placeHolder,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: ThemeHelper.lightGrey)),
        onChanged: (value) async {
          /*Prediction? prediction = await PlacesAutocomplete.show(
            radius: 500000,
            startText: value,
            context: context,
            apiKey: 'AIzaSyDQiFkb2LQuyamAtqPf6W3ATjwsuNpEPtA',
            mode: Mode.overlay,
            language: 'it',
            //components: [Component(Component.country, 'it')],
          );

          if (prediction != null) {
            PlacesDetailsResponse detail = await GoogleMapsPlaces(
                    apiKey: 'AIzaSyDQiFkb2LQuyamAtqPf6W3ATjwsuNpEPtA')
                .getDetailsByPlaceId(prediction.placeId!);
            double lat = detail.result.geometry!.location.lat;
            double lng = detail.result.geometry!.location.lng;
            String formattedAddress = detail.result.formattedAddress ?? '';

            controller!.text = formattedAddress;
            //onFieldSubmitted!(formattedAddress);
          }*/
        },
      ),
    );
  }
}
