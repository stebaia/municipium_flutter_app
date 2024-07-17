import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';

@RoutePage()
class LoginSpidIdpListPage extends StatelessWidget {
  const LoginSpidIdpListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = (context.read<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          municipality.municipalityName.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(),
    );
  }
}
