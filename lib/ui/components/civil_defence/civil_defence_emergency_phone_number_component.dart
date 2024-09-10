import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/bloc/civil_defence_bloc/emergency_call/emergency_call_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CivilDefenceEmergencyPhoneNumberComponent extends StatelessWidget {
  const CivilDefenceEmergencyPhoneNumberComponent(
      {super.key, required this.mContext});

  final BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyCallBloc, EmergencyCallState>(
      bloc: mContext.read<EmergencyCallBloc>(),
      builder: (context, state) {
        if (state is NoEmergencyCallListState) {
          return const Center(child: Text('Nessun dato presente'));
        } else if (state is FetchingEmergencyCallListState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorEmergencyCallListState) {
          return const Center(child: Text('Errore nel caricamento dei dati'));
        } else if (state is FetchedEmergencyCallListState) {
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.blue)),
                child: Center(
                    child: Text(
                        state.emergencyCallList[index].name.toUpperCase())),
              ),
              onTap: () => launchUrl(
                  Uri.parse('tel:${state.emergencyCallList[index].number}')),
            ),
            itemCount: state.emergencyCallList.length,
            shrinkWrap: true,
            primary: false,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
