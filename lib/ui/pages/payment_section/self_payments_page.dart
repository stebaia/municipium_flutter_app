import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/self_payment_bloc/self_payment_bloc.dart';
import 'package:municipium/model/payment/self_payment.dart';
import 'package:municipium/ui/components/sectioned_list_view.dart';

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
        appBar: AppBar(
          title: Text('Tabbed Sectioned ListView'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 80),
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cerca',
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
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<SelfPaymentBloc, SelfPaymentState>(
          builder: (context, state) {
            if (state is ErrorSelfPaymentState) {
              return Text('errore');
            }
            if (state is FetchedSelfPaymentState) {
              final List<Section<ListItem>> sectionList =
                  createItemList(state.selfPaymentsList);
              return TabBarView(
                children: [
                  SectionedListView<ListItem>(
                    sections: sectionList,
                    sectionHeaderBuilder: (context, title) => Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    itemBuilder: (context, item) => Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12.0),
                        title: Text(
                          item.title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          item.description,
                          style: TextStyle(color: Colors.white70),
                        ),
                        onTap: () {},
                      ),
                    ),
                    //itemsCombinedDecoration: BoxDecoration(color: Colors.green),
                  ),
                  SectionedListView<ListItem>(
                    sections: sectionList,
                    sectionHeaderBuilder: (context, title) => Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    itemBuilder: (context, item) => ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.description),
                      onTap: () {},
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
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
                    ))
                .toList()))
        .toList();
    return returnList;
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<SelfPaymentBloc>(
          create: (context) =>
              SelfPaymentBloc(paymentRepository: context.read())
                ..fetchSelfPayments(baseUrl, ente, area, codice),
        )
      ], child: this);
}
