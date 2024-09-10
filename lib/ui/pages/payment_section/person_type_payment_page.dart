import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/payment_cubit/payment_cubit.dart';
import 'package:municipium/bloc/payment_response_bloc/payment_response_bloc.dart';
import 'package:municipium/model/payment/saved_payment.dart';
import 'package:municipium/ui/components/buttons/rounded_shape_button.dart';
import 'package:municipium/utils/component_factory.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class PersonTypePaymentPage extends StatelessWidget
    implements AutoRouteWrapper {
  String baseUrl;
  String ente;
  String codice;

  PersonTypePaymentPage(
      {super.key,
      required this.baseUrl,
      required this.ente,
      required this.codice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.maybePop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<PaymentResponseBloc, PaymentResponseState>(
        builder: (context, state) {
          if (state is ErrorPaymentResponseState) {
            return const Text('errore');
          } else if (state is FetchedPaymentResponseState) {
            return BlocBuilder<PaymentCubit, SavedPayment>(
              builder: (context, savedPayment) {
                var buttonActive = savedPayment.isSelectedFisicPerson! ||
                    savedPayment.isSelectedGiuridicPerson!;
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.paymentResponse.tipoPagamento!
                                      .descrizioneTipoPagamento ??
                                  '',
                              style: const TextStyle(
                                color: Color.fromRGBO(188, 191, 200, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Categoria versante',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.4,
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Seleziona la categoria',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<PaymentCubit>()
                                    .setIsFisicPerson(true);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: savedPayment.isSelectedFisicPerson!
                                        ? 3
                                        : 1,
                                    color: savedPayment.isSelectedFisicPerson!
                                        ? ThemeHelper.blueMunicipium
                                        : Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Persona fisica',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<PaymentCubit>()
                                    .setIsGiuridicPerson(true);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width:
                                        savedPayment.isSelectedGiuridicPerson!
                                            ? 3
                                            : 1,
                                    color:
                                        savedPayment.isSelectedGiuridicPerson!
                                            ? ThemeHelper.blueMunicipium
                                            : Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Persona Giuridica',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            ComponentFactory.createCheckbox(
                              savedPayment.strangerPerson!,
                              const Text(
                                'Versante di residenza straniera',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              onChanged: (value) {
                                context
                                    .read<PaymentCubit>()
                                    .setIsStranger(value ?? false);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*TextButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: RoundedShapeButton(
                                title: AppLocalizations.of(context)!.back_desc,
                                borderColor: ThemeHelper.blueMunicipium,
                                color: Colors.white,
                                textColor: ThemeHelper.blueMunicipium,
                              ),
                            ),*/
                            const SizedBox(),
                            TextButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                              },
                              child: RoundedShapeButton(
                                title: AppLocalizations.of(context)!.next_desc,
                                color: buttonActive
                                    ? ThemeHelper.blueMunicipium
                                    : Colors.grey,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Text('TODO');
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<PaymentCubit>(
            create: (context) =>
                PaymentCubit(paymentsRepository: context.read()),
          ),
          BlocProvider<PaymentResponseBloc>(
            create: (context) => PaymentResponseBloc(
              paymentRepository: context.read(),
            )..fetchPaymentResponse(
                'https://collaudo-multe.comune-online.it/',
                ente,
                codice,
              ),
          ),
        ],
        child: this,
      );
}
