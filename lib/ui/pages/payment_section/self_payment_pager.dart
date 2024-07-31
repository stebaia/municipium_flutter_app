import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/cubit/payment_cubit/payment_cubit.dart';
import 'package:municipium/bloc/payment_response_bloc/payment_response_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/model/payment/saved_payment.dart';
import 'package:municipium/ui/components/buttons/rounded_shape_button.dart';
import 'package:municipium/ui/components/pager/progress_pager_stepper.dart';
import 'package:municipium/utils/theme_helper.dart';

@RoutePage()
class SelfPaymentPager extends StatelessWidget implements AutoRouteWrapper {
  SelfPaymentPager(
      {super.key,
      required this.baseUrl,
      required this.ente,
      required this.codice});
  final String baseUrl;
  final String ente;
  final String codice;
  int totalPage = 0;

  final List<Widget> pages = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  bool checkRuleForStep(BuildContext context, SavedPayment payment) {
    final model = context.watch<PaymentCubit>().state;
    switch (payment.currentPage) {
      case 0: //pagina categoria

      case 1: //pagina messaggio e dati personali

      case 2: //pagina galleria

      case 3:
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final paymentCubit = context.read<PaymentCubit>();
    return Scaffold(
      appBar: AppBar(
        // Rimuovi il titolo
        title: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.maybePop();
              // Azione da eseguire quando il pulsante viene premuto
              // go to next page
            },
          ),
        ],
      ),
      body: BlocConsumer<PaymentResponseBloc, PaymentResponseState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<PaymentCubit, SavedPayment>(
            builder: (context, savedState) {
              bool checkStep = checkRuleForStep(context, savedState);
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.new_issue.toUpperCase(),
                        style: const TextStyle(
                            color: ThemeHelper.lightGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.4),
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        getTitle(context, savedState.currentPage!),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProgressPagerStepper(
                      totalPage: totalPage,
                      currentPage: savedState.currentPage!),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        itemCount: pages.length,
                        onPageChanged: (value) {
                          //issueCubit.setCurrentPage(value);
                        },
                        itemBuilder: ((context, index) {
                          return pages[index];
                        })),
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        savedState.currentPage != 0
                            ? TextButton(
                                onPressed: (() {
                                  FocusScope.of(context).unfocus();
                                  pageController.previousPage(
                                    duration: const Duration(
                                        milliseconds:
                                            500), // Durata dell'animazione
                                    curve: Curves.ease, // Curva dell'animazione
                                  );
                                }),
                                child: RoundedShapeButton(
                                    title:
                                        AppLocalizations.of(context)!.back_desc,
                                    color: ThemeHelper.blueMunicipium,
                                    textColor: Colors.white),
                              )
                            : Container(),
                        const SizedBox(),
                        TextButton(
                          onPressed: checkStep
                              ? (() async {
                                  if (savedState.currentPage ==
                                      pages.length - 1) {
                                  } else {
                                    FocusScope.of(context).unfocus();
                                    pageController.nextPage(
                                      duration: const Duration(
                                          milliseconds:
                                              500), // Durata dell'animazione
                                      curve:
                                          Curves.ease, // Curva dell'animazione
                                    );
                                  }
                                })
                              : null,
                          child: RoundedShapeButton(
                              title: savedState.currentPage! != totalPage - 1
                                  ? AppLocalizations.of(context)!.next_desc
                                  : AppLocalizations.of(context)!.send_desc,
                              color: checkStep
                                  ? ThemeHelper.blueMunicipium
                                  : Colors.grey,
                              textColor: Colors.white),
                        )
                      ],
                    ),
                  )
                ]),
              );
            },
          );
        },
      ),
    );
  }

  String getTitle(BuildContext context, int currentPage) {
    switch (currentPage) {
      case 0:
        return AppLocalizations.of(context)!.issue_type;
      case 1:
        return AppLocalizations.of(context)!.issue_data;
      case 2:
        return AppLocalizations.of(context)!.issue_photo;
      case 3:
        return AppLocalizations.of(context)!.issue_recap;
      default:
        return '';
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PaymentCubit>(
          create: (context) => PaymentCubit(paymentsRepository: context.read()),
        ),
        BlocProvider<PaymentResponseBloc>(
          create: (context) => PaymentResponseBloc(
            paymentRepository: context.read(),
          )..fetchPaymentResponse(baseUrl, ente, codice),
        )
      ], child: this);
}
