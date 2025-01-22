import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:municipium/bloc/bloc/garbage_blocs/garbage_collection_bloc/garbage_collection_bloc.dart';
import 'package:municipium/utils/base_url_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



@RoutePage()
class GarbageInfoRetirementPage extends StatelessWidget implements AutoRouteWrapper {
  const GarbageInfoRetirementPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!
              .garbage_collections_menu.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: BlocBuilder<GarbageCollectionBloc, GarbageCollectionState>(
        builder: (context, state) {
          if (state is FetchingGarbageCollectionState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchedGarbageCollectionState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.email),
                        const SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.email_desc, style: Theme.of(context).textTheme.titleMedium,),
                        const Spacer(),
                        Text(state.garbageCollection.email, style: Theme.of(context).textTheme.bodyMedium,),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.text_telephone, style: Theme.of(context).textTheme.titleMedium,),
                        const Spacer(),
                        Text(state.garbageCollection.phoneNumber, style: Theme.of(context).textTheme.bodyMedium,),
                      ],
                    ),
                  ),
                   const Divider(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.fax),
                        const SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.text_fax, style: Theme.of(context).textTheme.titleMedium,),
                        const Spacer(),
                        Text(state.garbageCollection.faxNumber, style: Theme.of(context).textTheme.bodyMedium,),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.description),
                            const SizedBox(width: 10,),
                            Text(AppLocalizations.of(context)!.label_text_description, style: Theme.of(context).textTheme.titleMedium,),
                            
                          ],
                        ),
                        Html(data: state.garbageCollection.instructions,),
                      ],
                    ),
                  ),
                ]
              )
            );
          } else {
            return Container();
          }
        },
      ),

    );
  }
  
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GarbageCollectionBloc(garbageCollectionRepository: context.read())..fetchGarbageCollection(Provider.of<BaseUrlNotifier>(context, listen: false).baseUrl,)),
      
     
    ],
    child: this,
  );
}