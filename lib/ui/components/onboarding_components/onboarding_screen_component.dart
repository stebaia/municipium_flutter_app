import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:municipium/ui/components/image_full_width.dart';

class OnboardingScreenComponent extends StatelessWidget {
  const OnboardingScreenComponent({super.key, required this.textOnboarding});
  final String textOnboarding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        children: [
          ImageFullWidth(),
          const SizedBox(height: 20,),
          Text(textOnboarding)
        ],
      ),
    );
  }
}