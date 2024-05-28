import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/issue_list_bloc/issue_list_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/shimmer_utils.dart';

@RoutePage()
class IssuesListPage extends StatefulWidget implements AutoRouteWrapper {
  const IssuesListPage({super.key});

  @override
  State<IssuesListPage> createState() => _IssuesListPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<IssueListBloc>(
          create: (context) =>
              IssueListBloc(issuesRepository: context.read())..fetchIssueList(),
        )
      ], child: this);
}

class _IssuesListPageState extends State<IssuesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Segnalazioni'),
        leading: IconButton(
          onPressed: () => context.router.popUntil(
              (route) => route.settings.name == CoreMunicipalityRoute.name),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_sharp,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: BlocBuilder<IssueListBloc, IssueListState>(
          builder: (context, state) {
            if (state is FetchingIssueListState) {
              return ShimmerUtils.buildShimmer(6);
            } else if (state is FetchedIssueListState) {
              return ListView.builder(
                  itemCount: state.issueItemList.length,
                  itemBuilder: ((context, index) => GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 248, 253, 1),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Segnalazione #${state.issueItemList[index].id}'),
                                  Text(MunicipiumUtility.convertDate(
                                      state.issueItemList[index].createdAt,
                                      'dd.MM hh:mm'))
                                ],
                              ),
                              Text(
                                state.issueItemList[index].content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      )));
            } else if (state is NoIssueListState) {
              return Text('non issues');
            } else {
              return Text('errore');
            }
          },
        ),
      ),
    );
  }
}
