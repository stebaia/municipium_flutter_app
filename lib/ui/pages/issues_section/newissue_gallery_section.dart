import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/theme_helper.dart';

class NewIssueGallerySection extends StatelessWidget {
  const NewIssueGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    List<Image> imageList = [];
    return BlocBuilder<IssueCubit, ProgressIssue>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                getButton(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    title: 'Aggiungi foto dalla galleria',
                    icon: Icons.add),
                const SizedBox(
                  height: 16,
                ),
                getButton(
                    title: 'Scatta nuove foto',
                    icon: Icons.camera_alt_outlined),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selected,
                      onChanged: (value) {},
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
                checkGallery() ?? Container()
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Esegui qualcosa con l'immagine selezionata
      // Ad esempio, visualizzala in un'immagine o esegui altre operazioni
      // pickedImage.path contiene il percorso dell'immagine selezionata
    } else {
      // L'utente ha annullato la selezione dell'immagine
    }
  }

  Widget? checkGallery({List<Image>? imageList}) {
    if (imageList != null && imageList.isNotEmpty) {
      return Column(
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
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0), child: imageList[index]);
            },
          ),
        ],
      );
    }
  }

  Widget getButton({String? title, IconData? icon, Function()? onTap}) {
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
