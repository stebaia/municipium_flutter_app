import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/civil_defence/civil_defence_emergency_call.dart';
import 'package:municipium/model/events/event_detail.dart';
import 'package:municipium/model/events/event_item_list.dart';
import 'package:municipium/model/issue/issue_category_tag.dart';
import 'package:municipium/model/issue/issue_item_list.dart';
import 'package:municipium/model/issue/issue_tag.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/news/news_detail.dart';
import 'package:municipium/model/news/news_item_list.dart';
import 'package:municipium/model/pnrr/service_pnrr.dart';
import 'package:municipium/model/point_of_interests_item.dart';
import 'package:municipium/model/point_of_intertests_list.dart';
import 'package:municipium/repositories/civil_defence_repository.dart';
import 'package:municipium/repositories/events_repository.dart';
import 'package:municipium/repositories/issues_repository.dart';
import 'package:municipium/repositories/mappers/civil_defence_mapper/civil_defence_emergency_call_mapper.dart';
import 'package:municipium/repositories/mappers/event_mapper/event_detail_mapper.dart';
import 'package:municipium/repositories/mappers/event_mapper/event_item_mapper.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_category_tag_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_item_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_tag_mapper.dart';
import 'package:municipium/repositories/mappers/item_category_mapper.dart';
import 'package:municipium/repositories/mappers/municipality_mapper.dart';
import 'package:municipium/repositories/mappers/municipality_secure_mapper.dart';
import 'package:municipium/repositories/mappers/news_detail_mapper.dart';
import 'package:municipium/repositories/mappers/news_item_mapper.dart';
import 'package:municipium/repositories/mappers/pnrr/service_pnrr_mapper.dart';
import 'package:municipium/repositories/mappers/point_of_interest_item_mapper.dart';
import 'package:municipium/repositories/mappers/point_of_interests_list_mapper.dart';
import 'package:municipium/repositories/municipality_repository.dart';
import 'package:municipium/repositories/news_repository.dart';
import 'package:municipium/repositories/pnrr_service_repository.dart';
import 'package:municipium/repositories/point_of_interest_repository.dart';
import 'package:municipium/services/network/api/civil_defence_service/civil_defence_service.dart';
import 'package:municipium/services/network/api/event_service/event_service.dart';
import 'package:municipium/services/network/api/issue_service/issue_service.dart';
import 'package:municipium/services/network/api/municipality_service/municipality_service.dart';
import 'package:municipium/services/network/api/news_service/news_service.dart';
import 'package:municipium/services/network/api/pnrr_service/pnrr_service.dart';
import 'package:municipium/services/network/api/point_of_intertest_service/point_of_interest_service.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:municipium/services/network/dto/event_detail_dto.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:municipium/services/network/dto/issue_category_tag_dto.dart';
import 'package:municipium/services/network/dto/issue_dto.dart';
import 'package:municipium/services/network/dto/issue_tag_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:municipium/services/network/dto/point_of_interests_list_dto.dart';
import 'package:municipium/services/network/dto/service_pnrr_dto.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:pine/pine.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'blocs.dart';
part 'mappers.dart';
part 'providers.dart';
part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SingleChildWidget>>(
      future: providersFun(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DependencyInjectorHelper(
            blocs: _blocs,
            mappers: _mappers,
            providers: snapshot.data!,
            repositories: _repositories,
            child: child,
          );
        } else {
          // Restituisci un indicatore di caricamento o qualcosa di simile mentre aspetti i dati
          return CircularProgressIndicator();
        }
      },
    );
  }
}
