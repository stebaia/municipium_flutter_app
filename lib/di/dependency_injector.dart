import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/news_item_list.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/item_category_mapper.dart';
import 'package:municipium/repositories/mappers/municipality_mapper.dart';
import 'package:municipium/repositories/mappers/municipality_secure_mapper.dart';
import 'package:municipium/repositories/mappers/news_item_mapper.dart';
import 'package:municipium/repositories/municipality_repository.dart';
import 'package:municipium/repositories/news_repository.dart';
import 'package:municipium/services/network/api/municipality_service/municipality_service.dart';
import 'package:municipium/services/network/api/news_service/news_service.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
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
