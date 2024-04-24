import 'package:flutter/material.dart';
import 'package:municipium/utils/municipium_utility.dart';

class DetailImageBox extends StatelessWidget {
  const DetailImageBox({super.key, required this.baseUrl, required this.url});
  final String? baseUrl;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          baseUrl != null
              ? '${baseUrl!}${url!}'
              : MunicipiumUtility.getDefaultImageUrl(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
