import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:path/path.dart';
import 'package:photo_manager/photo_manager.dart';

class NewIssueGallerySection extends StatelessWidget {
  NewIssueGallerySection({super.key});
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                _getButton(
                    onTap: () {
                      _pickImageFromGallery(context);
                    },
                    title: 'Aggiungi foto dalla galleria',
                    icon: Icons.add),
                const SizedBox(
                  height: 16,
                ),
                _getButton(
                    onTap: () {
                      _pickImages(context);
                    },
                    title: 'Scatta nuove foto',
                    icon: Icons.camera_alt_outlined),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: state.noPhoto,
                      activeColor: ThemeHelper.blueMunicipium,
                      onChanged: (value) {
                        context.read<IssueCubit>().setNoPhoto(value ?? false);
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Non ho foto da aggiungere',
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                _checkGallery(imageList: state.imageList),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final cubit = context.read<IssueCubit>();
    final int sizeLimit = 4 - (cubit.state.imageList ?? []).length;
    if (sizeLimit > 1) {
      final List<XFile> pickedFiles = await picker.pickMultiImage(
          imageQuality: 50, maxWidth: 800, limit: sizeLimit);
      cubit.setImageList(pickedFiles);
    } else if (sizeLimit > 0) {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        cubit.setImageList([pickedFile]);
      }
    }
  }

  Widget _checkGallery({List<XFile>? imageList}) {
    if (imageList != null && imageList.isNotEmpty) {
      return SizedBox(
        height: 150,
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'FOTO AGGIUNTE',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                SizedBox()
              ],
            ),
            Expanded(
              child: ListView.builder(
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
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(245, 248, 253, 1)),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<IssueCubit>()
                                        .removePhoto(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: ThemeHelper.blueMunicipium,
                                  ),
                                  iconSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> _pickImages(BuildContext context) async {}

  Widget _getButton({String? title, IconData? icon, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(color: ThemeHelper.blueMunicipium),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                size: 30,
                icon,
                color: ThemeHelper.blueMunicipium,
              ),
              Text(
                title ?? '',
                style: const TextStyle(
                    color: ThemeHelper.blueMunicipium,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox()
            ],
          )),
    );
  }
}
