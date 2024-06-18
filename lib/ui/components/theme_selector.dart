import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/theme_cubit/theme_cubit.dart';
import 'package:path/path.dart';

typedef ThemeSelectorWidgetBuilder = Widget Function(BuildContext, ThemeMode);

class ThemeSelector extends StatelessWidget {
  final ThemeSelectorWidgetBuilder builder;
  const ThemeSelector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => builder(
            context,
            state.light
                ? ThemeMode.light
                : state.dark
                    ? ThemeMode.dark
                    : ThemeMode.system),
      );
}
