import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageFullWidth extends StatelessWidget {
  ImageFullWidth({super.key, this.height  = 300});
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: const Center(child: Icon(Icons.image),),
        );
  }
}