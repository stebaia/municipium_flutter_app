part of 'base_url_cubit.dart';

class BaseUrlState extends Equatable {
  final BaseUrlType baseUrlType;
  const BaseUrlState([this.baseUrlType = BaseUrlType.prod]);

  bool get prod => baseUrlType == BaseUrlType.prod;

  bool get staging => baseUrlType == BaseUrlType.staging;
  
  @override
  // TODO: implement props
  List<Object?> get props => [baseUrlType];
}
