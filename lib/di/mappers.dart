part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<Mapper<Municipality, String>>(
    create: (_) => MunicipalitySecureMapper(),
  ),
  Provider<DTOMapper<MunicipalityDTO, Municipality>>(
    create: (_) => MunicipalityMapper(),
  ),
];
