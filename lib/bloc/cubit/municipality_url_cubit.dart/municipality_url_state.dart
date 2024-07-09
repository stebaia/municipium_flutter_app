part of 'municipality_url_cubit.dart';

class MunicipalityUrlState extends Equatable {
  const MunicipalityUrlState();

  @override
  List<Object> get props => [];
}

class MunicipalityUrlLoaded extends MunicipalityUrlState {
  final String baseUrl;

  const MunicipalityUrlLoaded(this.baseUrl);
}

class MunicipalityUrlEmpty extends MunicipalityUrlState {
  const MunicipalityUrlEmpty();
}

class MunicipalityUrlLoading extends MunicipalityUrlState {
  const MunicipalityUrlLoading();
}
