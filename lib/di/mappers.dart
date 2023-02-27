part of 'dependency_injector.dart';


final List<SingleChildWidget> _mappers = [
  Provider<DTOMapper<MunicipalityDTO, Municipality>>(
    create: (_) => MunicipalityMapper(),
  ),
];