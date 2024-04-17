import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/services/network/dto/new_menu_dto.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final municipality =
        (context.read<MunicipalityBloc>().state as FetchedMunicipalityState)
            .municipality;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              GestureDetector(child: const Icon(Icons.close))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.person_outlined),
                  SizedBox(width: 16),
                  Text(municipality.subdomain,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(width: 20)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 16),
                  Text('Cambia comune',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(width: 20)
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
