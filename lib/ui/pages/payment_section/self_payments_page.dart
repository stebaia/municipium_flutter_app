import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/self_payment_bloc/self_payment_bloc.dart';
import 'package:municipium/model/payment/payment_type.dart';
import 'package:municipium/model/payment/self_payment.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/sectioned_list_view.dart';
import 'package:municipium/ui/pages/payment_section/new_self_payment_pager.dart';
import 'package:municipium/utils/shimmer_utils.dart';

@RoutePage()
class SelfPaymentsPage extends StatelessWidget implements AutoRouteWrapper {
  SelfPaymentsPage({super.key, required this.baseUrl, required this.ente});

  String baseUrl;
  String ente;
  String? area;
  String? codice;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: const Text(
            'EFFETTUA UN PAGAMENTO',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Spontanei',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Tab(text: 'In sospeso'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<SelfPaymentBloc, SelfPaymentState>(
          builder: (context, state) {
            List<SelfPayment> payments =
                (context.read<SelfPaymentBloc>().allPayments);

            if (context.read<SelfPaymentBloc>().isSearching) {
              payments = (context.read<SelfPaymentBloc>().allPaymentsFiltered);
              print('Using filtered list');
            }
            if (state is FetchingSelfPaymentState && payments.isEmpty) {
              return ShimmerUtils.buildShimmer(6);
            } else if (state is FetchedSelfPaymentState) {
              context.read<SelfPaymentBloc>().isFetching = false;
            } else if (state is NoSelfPaymentState) {
              return const Center(child: CircularProgressIndicator());
            }
            List<Section<ListItem>> sectionList = createItemList(payments);
            return TabBarView(
              children: [
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: ((value) {
                            context.read<SelfPaymentBloc>().isSearching =
                                value != '';
                            print(
                                'now im ${value != '' ? 'searching word ' + value : 'not searching'}');
                            context
                                .read<SelfPaymentBloc>()
                                .filterSelfPayment(value);
                          }),
                          decoration: InputDecoration(
                            hintText: 'Cerca un pagamento',
                            hintStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(240, 241, 250, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SectionedListView<ListItem>(
                        sections: sectionList,
                        sectionHeaderBuilder: (context, title) => Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        itemBuilder: (context, item, index, sectionIndex) {
                          BorderRadius? radius;
                          if (sectionList[sectionIndex].items.length - 1 ==
                              index) {
                            radius = const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16));
                          } else if (index == 0) {
                            radius = const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16));
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(240, 241, 250, 1),
                                  borderRadius: radius ?? BorderRadius.zero)
                              /*boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],*/
                              ,
                              child: ListTile(
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                                contentPadding: const EdgeInsets.all(12.0),
                                title: Text(
                                  item.title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.15),
                                ),
                                subtitle: Text(
                                  item.description,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                onTap: () {
                                  context.pushRoute(PersonTypePaymentRoute(
                                      baseUrl: baseUrl,
                                      ente: 'MOL',
                                      codice:
                                          (item.item as PaymentType).codice ??
                                              ''));
                                  /*context.pushRoute(NewSelfPaymentRouter(
                                      baseUrl: baseUrl,
                                      ente: 'MOL',
                                      codice:
                                          (item.item as PaymentType).codice ??
                                              ''));*/
                                },
                              ),
                            ),
                          );
                        },
                        separator: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: const Color.fromRGBO(240, 241, 250, 1),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                                height: 1,
                                color: Colors.grey[300]), // Separatore sottile
                          ),
                        ),
                        sectionSeparator: const SizedBox(
                          height: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SectionedListView<ListItem>(
                  sections: sectionList,
                  sectionHeaderBuilder: (context, title) => Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  itemBuilder: (context, item, index, sectionIndex) => ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.description),
                    onTap: () {},
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Section<ListItem>> createItemList(List<SelfPayment> startList) {
    List<Section<ListItem>> returnList = [];
    returnList = startList
        .map((area) => Section<ListItem>(
            title: area.area ?? '',
            items: (area.tipoPagamenti ?? [])
                .map<ListItem>((tipoPagamento) => ListItem(
                    title: tipoPagamento.descrizione ?? '',
                    description: tipoPagamento.codiceDebitoJppa ?? '',
                    item: tipoPagamento))
                .toList()))
        .toList();
    return returnList;
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<SelfPaymentBloc>(
          create: (context) =>
              SelfPaymentBloc(paymentRepository: context.read())
                ..fetchSelfPayments('https://collaudo-multe.comune-online.it/',
                    'MOL', area, codice),
        )
      ], child: this);
}
