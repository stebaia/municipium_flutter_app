import 'package:flutter/material.dart';

class ChangeThemeButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const ChangeThemeButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) =>
      IconButton(onPressed: onPressed, icon: const Icon(Icons.delete));
}
