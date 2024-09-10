import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CustomDiHelper extends StatelessWidget {
  final List<SingleChildWidget>? mappers;
  final List<SingleChildWidget>? providers;
  final List<SingleChildWidget>? customService;
  final List<RepositoryProvider>? repositories;
  final List<BlocProvider>? blocs;
  final Widget child;

  const CustomDiHelper({
    super.key,
    this.providers,
    this.repositories,
    this.mappers,
    this.blocs,
    this.customService,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (mappers?.isNotEmpty ?? false) {
      return MultiProvider(
        providers: mappers!,
        child: _providers,
      );
    }

    return _providers;
  }

  Widget get _providers {
    if (providers?.isNotEmpty ?? false) {
      return MultiProvider(
        providers: providers!,
        child: _repositories,
      );
    }

    return _repositories;
  }



  Widget get _repositories {
    if (repositories?.isNotEmpty ?? false) {
      return MultiRepositoryProvider(
        providers: repositories!,
        child: _blocs,
      );
    }

    return _blocs;
  }

  Widget get _blocs {
    if (blocs?.isNotEmpty ?? false) {
      return MultiBlocProvider(
        providers: blocs!,
        child: _customService,
      );
    }

    return _customService;
  }

  Widget get _customService {
    if (customService?.isNotEmpty ?? false) {
      return MultiBlocProvider(
        providers: customService!,
        child: child,
      );
    }

    return child;
  }
}
