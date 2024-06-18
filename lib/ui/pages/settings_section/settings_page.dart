import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/theme_cubit/theme_cubit.dart';
import 'package:municipium/ui/components/bottom_sheet/selector_value_sheet.dart';
import 'package:municipium/ui/components/theme/settings_tile_bloc_builder.dart';
import 'package:municipium/utils/theme_style.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // Rimuovi il titolo
          title: const SizedBox.shrink(),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: Text(AppLocalizations.of(context)!.settings_app),
              tiles: [
                SettingsTileBlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) => SettingsTile(
                          title: Text(
                              AppLocalizations.of(context)!.settings_theme),
                          leading: const Icon(Icons.lightbulb),
                          value: Text(state.theme.localize(context) ??
                              state.theme.name),
                          onPressed: (context) => showModalBottomSheet(
                              context: context,
                              builder: (_) => SelectorValueSheet<ThemeType>(
                                    title: AppLocalizations.of(context)!
                                        .settings_theme,
                                    values: ThemeType.values,
                                    initialValue: state.theme,
                                    localizeValue: (theme) =>
                                        theme.localize(context),
                                    onSelectedValueChanged:
                                        context.watch<ThemeCubit>().setTheme,
                                  )),
                        ))
              ],
            )
          ],
        ),
      );
}
