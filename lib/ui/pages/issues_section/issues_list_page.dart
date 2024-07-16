import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:municipium/bloc/issue_list_bloc/issue_list_bloc.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/shimmer_utils.dart';
import 'package:municipium/utils/theme_helper.dart';

@RoutePage()
class IssuesListPage extends StatefulWidget implements AutoRouteWrapper {
  IssuesListPage({super.key, required this.udid});
  String udid;
  @override
  State<IssuesListPage> createState() => _IssuesListPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<IssueListBloc>(
          create: (context) => IssueListBloc(issuesRepository: context.read())
            ..fetchIssueList(udid),
        )
      ], child: this);
}

class _IssuesListPageState extends State<IssuesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 248, 253, 1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Segnalazione #${state.issueItemList[index].id}',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                          MunicipiumUtility.convertDate(
                                              state.issueItemList[index]
                                                  .createdAt,
                                              'd MMM HH:mm',
                                              todayYesterdayIncluded: true),
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  141, 144, 152, 1),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(state.issueItemList[index].content,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(141, 144, 152, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: const Color.fromRGBO(
                                                204, 223, 255, 1)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 24),
                                          child: Text(
                                            state.issueItemList[index].closed
                                                ? 'Chiusa'
                                                : 'Aperta',
                                            style: const TextStyle(
                                                color:
                                                    ThemeHelper.blueMunicipium,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: const Color.fromRGBO(
                                                204, 223, 255, 1)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 24),
                                          child: Text(
                                            state.issueItemList[index].merged
                                                ? 'Sincronizzato'
                                                : 'Da sincronizzare',
                                            style: const TextStyle(
                                                color:
                                                    ThemeHelper.blueMunicipium,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
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
