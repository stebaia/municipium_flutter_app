import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:municipium/bloc/cubit/visibility_cubit/visibility_cubit.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';
import 'package:municipium/utils/position_utils.dart';

@RoutePage()
class OnboardingSearchMunicipalityPage extends StatelessWidget implements AutoRouteWrapper{
  const OnboardingSearchMunicipalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cerca il tuo comune', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            TextField(
              onChanged: (value) {
                if(value.length >= 3){
                  context.read<VisibilityCubit>().show();
                } 
              },
              decoration: InputDecoration(
                suffixIcon: GestureDetector(onTap: () async {
                  Position position = await PositionUtils.determinePosition();
                  print(position);
                  context.read<MunicipalityBloc>().fetchMunicipalityListWithPosition(position.latitude, position.longitude);
                },child: Icon(Icons.gps_fixed, color: Colors.grey[400],)),
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red,)
                  
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blue,)
                  
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "Cerca il tuo comune"     
              ),
            ),
            BlocBuilder<VisibilityCubit, VisibilityState>(builder:(context, state) {
              if(state == VisibilityState.visible) {
                return BlocBuilder<MunicipalityBloc, MunicipalityState>(
              builder: (context, state) {
                if (state is FetchedMunicipalityListState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.municipalityList.length,
                      itemBuilder: (context, index) {
                        final municipality = state.municipalityList[index];
                        return ListTile(
                          title: Text(municipality.municipalityName),
                          // Aggiungi qui altre informazioni che vuoi mostrare
                          onTap: () {
                            // Gestisci l'evento di tap sul municipio
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container(); // Potresti mostrare un indicatore di caricamento qui
                }
              },
            );
              }else{
                return Container();
              }
            },),
            
            const SizedBox(height: 30,),
            FullWidthConfirmButton(isEnabled: false, onTap: (){},)
          ],
        ),
      ),
    );
  }
  
   @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<MunicipalityBloc>(
          create: (context) =>
              MunicipalityBloc(municipalityRepository: context.read())..fetchMunicipalityList(),
        ),
        BlocProvider<VisibilityCubit>(
          create: (context) =>
              VisibilityCubit(),
        ),
      ], child: this);
}
