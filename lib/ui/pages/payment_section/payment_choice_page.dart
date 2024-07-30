import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/routers/app_router.gr.dart';

@RoutePage()
class PaymentChoicePage extends StatelessWidget {
  const PaymentChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final municipality = (context.watch<MunicipalityGlobalCubit>().state
            as StoredMunicipalityGlobalState)
        .municipality;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamenti'),
        leading: IconButton(
          onPressed: () => context.maybePop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              context.pushRoute(SelfPaymentsRoute(
                  baseUrl: municipality.jcityGovUrl,
                  ente: municipality.jcityGovEnte));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Effettua un pagamento',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(),
                  Icon(Icons.chevron_right_outlined)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
