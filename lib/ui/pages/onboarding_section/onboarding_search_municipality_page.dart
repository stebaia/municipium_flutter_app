import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/ui/components/buttons/fullwidth_button.dart';

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
              
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.gps_fixed, color: Colors.grey[400],),
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
                hintText: "Cerca il tuo comune",
                fillColor: Colors.white
              ),
            ),
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
              MunicipalityBloc(municipalityRepository: context.read()),
        )
      ], child: this);
}
