import 'package:flutter/material.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/ui/components/detail_image_box.dart';

class DetailGalleryBox extends StatelessWidget {
  const DetailGalleryBox(
      {super.key,
      required this.image,
      required this.images,
      required this.pageController});
  final MunicipiumImage image;
  final List<MunicipiumImage>? images;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount:
                (images != null && images!.isNotEmpty) ? images!.length : 1,
            itemBuilder: (BuildContext context, int index) {
              if (images != null && images!.isNotEmpty) {
                return DetailImageBox(
                  baseUrl: images![index].baseUrl,
                  url: images![index].i1920x1280,
                );
              } else {
                return DetailImageBox(
                  baseUrl: image.baseUrl,
                  url: image.i1920x1280,
                );
              }
            },
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                // Scorri alla pagina precedente
              },
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                // Scorri alla pagina successiva
              },
            ),
          ),
        ],
      ),
    );
  }
}
