import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipium/bloc/cubit/device_cubit/device_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/bloc/user_bloc/user_bloc.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/user/idp_model.dart';
import 'package:municipium/model/user/spid_object.dart';
import 'package:municipium/routers/app_router.gr.dart';

@RoutePage()
class LoginSpidIdpListPage extends StatelessWidget implements AutoRouteWrapper {
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
      body: BlocBuilder<UserBloc, UserState>(builder:(context, state) {
        if(state is FetchedListIdpState) {
          List<IdpModel> listIdp = state.idps;
          return ListView.builder(
            itemCount: listIdp.length,
            itemBuilder:(context, index) => Card(color: Colors.grey,surfaceTintColor: Colors.white , margin: const EdgeInsets.all(10),child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(child: Image.network(width: MediaQuery.of(context).size.width,height: 60,listIdp[index].logoUri!.replaceAll('.svg', '.png')), onTap: () async {
                DeviceBe? deviceBe = await context.read<DeviceCubit>().getDeviceBeFromStorage();

                if(deviceBe != null) {
                  String urlSpid = SpidObject.getWebSpidUrl(municipality.muninicipalityId.toString(), listIdp[index].entityId.toString(), deviceBe.playerId.toString(), deviceBe.udid, listIdp[index].organizationDisplayName.toString());
                  context.pushRoute(WebViewSpidAuthRoute(urlSpid: urlSpid,municipalityId: municipality.muninicipalityId.toString(), authSystem: 'spid'));
                }
                
              },),
            )),);
        }else if(state is FetchingListIdpState){
          return const Center(child: CircularProgressIndicator());
        }else {
          return Container();
        }
      },)
    );
  }
  
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
    BlocProvider<UserBloc>(
          create: (context) =>
              UserBloc(userRepository: context.read())..fetchListIdp(),
        )
  ], child: this);
}
