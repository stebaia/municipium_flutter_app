import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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

  static Widget createGalleryHorizzontalList(List<XFile> imageList,
      {Widget? title,
      Function(BuildContext context, int index)? onDeletePressed}) {
    ScrollController controller = ScrollController();
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          title ?? Container(),
          Expanded(
            child: Scrollbar(
              controller: controller,
              thumbVisibility: true,
              child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(imageList[index].path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          (onDeletePressed != null)
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromRGBO(245, 248, 253, 1)),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          onDeletePressed(context, index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: ThemeHelper.blueMunicipium,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
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
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(color: ThemeHelper.lightGrey),
              borderRadius: BorderRadius.circular(12)),
          child: TextFormField(
            keyboardType: keyboardType ?? TextInputType.text,
            initialValue: value,
            onChanged: onChanged,
            decoration: InputDecoration(
                suffixIcon: customIcon,
                hintText: placeHolder,
                border: InputBorder.none,
                hintStyle: const TextStyle(color: ThemeHelper.lightGrey)),
          ),
        )
      ],
    );
  }
}
