import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:municipium/bloc/cubit/base_url_cubit/base_url_cubit.dart';
import 'package:municipium/bloc/cubit/issue_cubit/issue_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_cubit/municipality_global/municipality_global_cubit.dart';
import 'package:municipium/bloc/cubit/theme_cubit/theme_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/temporary_menu_conf_cubit.dart';
import 'package:municipium/bloc/cubit/user_menu_conf_cubit/user_menu_conf_cubit_cubit.dart';
import 'package:municipium/bloc/cubit/municipality_url_cubit.dart/municipality_url_cubit.dart';
import 'package:municipium/bloc/municipality_bloc/municipality_bloc.dart';
import 'package:municipium/model/civil_defence/civil_defence_emergency_call.dart';
import 'package:municipium/model/device/device_be.dart';
import 'package:municipium/model/digital_dossier/digital_dossier_configuration.dart';
import 'package:municipium/model/events/event_detail.dart';
import 'package:municipium/model/events/event_item_list.dart';
import 'package:municipium/model/issue/issue_Detail.dart';
import 'package:municipium/model/issue/issue_category_tag.dart';
import 'package:municipium/model/issue/issue_item_list.dart';
import 'package:municipium/model/issue/issue_tag.dart';
import 'package:municipium/model/issue/progress_issue.dart';
import 'package:municipium/model/item_category.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/news/news_detail.dart';
import 'package:municipium/model/news/news_item_list.dart';
import 'package:municipium/model/payment/field_attribute.dart';
import 'package:municipium/model/payment/payment_custom_field.dart';
import 'package:municipium/model/payment/payment_response.dart';
import 'package:municipium/model/payment/self_payment.dart';
import 'package:municipium/model/pnrr/body_pnrr.dart';
import 'package:municipium/model/pnrr/body_pnrr_response.dart';
import 'package:municipium/model/pnrr/service_pnrr.dart';
import 'package:municipium/model/point_of_interests_item.dart';
import 'package:municipium/model/point_of_intertests_list.dart';
import 'package:municipium/model/reservations/reservable_unit.dart';
import 'package:municipium/model/user/user_configuration_menu.dart';
import 'package:municipium/repositories/civil_defence_repository.dart';
import 'package:municipium/repositories/events_repository.dart';
import 'package:municipium/repositories/issues_repository.dart';
import 'package:municipium/repositories/mappers/civil_defence_mapper/civil_defence_emergency_call_mapper.dart';
import 'package:municipium/repositories/mappers/configuration_mapper.dart';
import 'package:municipium/repositories/mappers/device_secure_mapper.dart';
import 'package:municipium/repositories/mappers/event_mapper/event_detail_mapper.dart';
import 'package:municipium/repositories/mappers/event_mapper/event_item_mapper.dart';
import 'package:municipium/repositories/mappers/image_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_category_tag_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_detail_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_item_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/issue_tag_mapper.dart';
import 'package:municipium/repositories/mappers/issue_mapper/post_issue_mapper.dart';
import 'package:municipium/repositories/mappers/item_category_mapper.dart';
import 'package:municipium/repositories/mappers/municipality_mapper.dart';
import 'package:municipium/repositories/mappers/municipality_secure_mapper.dart';
import 'package:municipium/repositories/mappers/news_detail_mapper.dart';
import 'package:municipium/repositories/mappers/news_item_mapper.dart';
import 'package:municipium/repositories/mappers/payment_mapper/field_attribute_mapper.dart';
import 'package:municipium/repositories/mappers/payment_mapper/payment_custom_field_mapper.dart';
import 'package:municipium/repositories/mappers/payment_mapper/payment_response_mapper.dart';
import 'package:municipium/repositories/mappers/payment_mapper/self_payment_mapper.dart';
import 'package:municipium/repositories/mappers/pnrr/body_pnrr_mapper.dart';
import 'package:municipium/repositories/mappers/pnrr/service_pnrr_mapper.dart';
import 'package:municipium/repositories/mappers/point_of_interest_item_mapper.dart';
import 'package:municipium/repositories/mappers/point_of_interests_list_mapper.dart';
import 'package:municipium/repositories/mappers/reservations_mapper/reservable_unit_mapper.dart';
import 'package:municipium/repositories/municipality_repository.dart';
import 'package:municipium/repositories/news_repository.dart';
import 'package:municipium/repositories/payments_repository.dart';
import 'package:municipium/repositories/pnrr_service_repository.dart';
import 'package:municipium/repositories/point_of_interest_repository.dart';
import 'package:municipium/repositories/reservations_repository.dart';
import 'package:municipium/repositories/user_repository.dart';
import 'package:municipium/services/network/api/civil_defence_service/civil_defence_service.dart';
import 'package:municipium/services/network/api/event_service/event_service.dart';
import 'package:municipium/services/network/api/issue_service/issue_service.dart';
import 'package:municipium/services/network/api/municipality_be_service/municipality_be_service.dart';
import 'package:municipium/services/network/api/municipality_configuration_service/municipality_configuration_service.dart';
import 'package:municipium/services/network/api/municipality_service/municipality_service.dart';
import 'package:municipium/services/network/api/news_service/news_service.dart';
import 'package:municipium/services/network/api/payment_service/payment_service.dart';
import 'package:municipium/services/network/api/pnrr_service/pnrr_service.dart';
import 'package:municipium/services/network/api/point_of_intertest_service/point_of_interest_service.dart';
import 'package:municipium/services/network/api/reservations/reservations_service.dart';
import 'package:municipium/services/network/dto/civild_defence_emergency_call_dto.dart';
import 'package:municipium/services/network/dto/event_detail_dto.dart';
import 'package:municipium/services/network/dto/event_dto.dart';
import 'package:municipium/services/network/dto/issue_category_tag_dto.dart';
import 'package:municipium/services/network/dto/issue_detail_dto.dart';
import 'package:municipium/services/network/dto/issue_dto.dart';
import 'package:municipium/services/network/dto/issue_tag_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';
import 'package:municipium/services/network/dto/news_categories_dto.dart';
import 'package:municipium/services/network/dto/news_dto.dart';
import 'package:municipium/services/network/dto/payment_response_dto.dart';
import 'package:municipium/services/network/dto/pnrr_body_dto.dart';
import 'package:municipium/services/network/dto/point_of_interests_list_dto.dart';
import 'package:municipium/services/network/dto/post_issue_dto.dart';
import 'package:municipium/services/network/dto/reservable_unit_dto.dart';
import 'package:municipium/services/network/dto/self_payment_dto.dart';
import 'package:municipium/services/network/dto/service_pnrr_dto.dart';
import 'package:municipium/utils/base_url_selector.dart';
import 'package:municipium/utils/municipium_utility.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:municipium/utils/theme_helper.dart';
import 'package:path/path.dart';
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
    return BlocProvider<BaseUrlCubit>(
      create: (context) => BaseUrlCubit(),
      child: Provider<SecureStorage>(
        create: (context) => SecureStorage(),
        child: BaseUrlSelector(
          builder: (context, state) {
            return BlocProvider(
              create: (context) => MunicipalityUrlCubit(
                  secureStorage: context.read(), baseUrl: state)
                ..fetchMunicipalityInStorage(),
              child: BlocBuilder<MunicipalityUrlCubit, MunicipalityUrlState>(
                builder: (context, muincipalityUrlState) {
                  String baseUrl;
                  Widget content;

                  if (muincipalityUrlState is MunicipalityUrlLoaded) {
                    baseUrl = muincipalityUrlState.baseUrl;
                  } else if (muincipalityUrlState is MunicipalityUrlEmpty) {
                    baseUrl = state.name == 'prod'
                        ? MunicipiumUtility.BASEURL_PROD
                        : MunicipiumUtility.BASEURL_STAGING;
                  } else {
                    baseUrl = ''; // or some default value if needed
                  }

                  if (muincipalityUrlState is MunicipalityUrlLoading) {
                    content = Container(
                      color: Colors.blue,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    content = DependencyInjectorHelper(
                      repositories: _repositories,
                      mappers: _mappers,
                      blocs: _blocs,
                      providers: providersFun(baseUrl: baseUrl),
                      child: child,
                    );
                  }

                  return content;
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
