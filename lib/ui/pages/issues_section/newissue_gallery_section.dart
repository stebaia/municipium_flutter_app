import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/component_factory.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:path/path.dart';
import 'package:photo_manager/photo_manager.dart';

class NewIssueGallerySection extends StatelessWidget {
  NewIssueGallerySection({super.key});
  ImagePicker _picker = ImagePicker();

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
                      _openCamera(context);
                    },
                    title: 'Scatta nuove foto',
                    icon: Icons.camera_alt_outlined),
                const SizedBox(
                  height: 16,
                ),
                ComponentFactory.createCheckbox(
                  state.noPhoto ?? false,
                  const Text(
                    'Non ho foto da aggiungere',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.4),
                  ),
                  onChanged: (value) {
                    context.read<IssueCubit>().setNoPhoto(value ?? false);
                  },
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
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
          imageQuality: 50, maxWidth: 800, limit: sizeLimit);
      cubit.setImageList(pickedFiles);
    } else if (sizeLimit > 0) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        cubit.setImageList([pickedFile]);
      }
    }
  }

  Widget _checkGallery({List<XFile>? imageList}) {
    if (imageList != null && imageList.isNotEmpty) {
      return ComponentFactory.createGalleryHorizzontalList(imageList,
          title: const Row(
            children: [
              Text(
                'FOTO AGGIUNTE',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.4),
              ),
              SizedBox()
            ],
          ), onDeletePressed: (context, index) {
        context.read<IssueCubit>().removePhoto(index);
      });
    } else {
      return Container();
    }
  }

  Future<void> _openCamera(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    final cubit = context.read<IssueCubit>();
    if (image != null) {
      cubit.setImageList([XFile(image.path)]);
    }
  }

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
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.4),
              ),
              const SizedBox()
            ],
          )),
    );
  }
}
