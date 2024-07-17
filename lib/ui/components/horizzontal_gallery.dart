import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/utils/theme_helper.dart';

class HorizzontalGallery extends StatelessWidget {
  HorizzontalGallery(
      {super.key,
      required this.imageList,
      this.title,
      this.onDeletePressed,
      this.height});

  List<XFile> imageList;
  Widget? title;
  Function(BuildContext context, int index)? onDeletePressed;
  double? height;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return SizedBox(
      height: height ?? 150,
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
                            width: (height != null) ? height! - 120 : 120,
                            height: (height != null) ? height! - 120 : 120,
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
                                          if (onDeletePressed != null) {
                                            onDeletePressed!(context, index);
                                          }
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
}
