import 'package:equatable/equatable.dart';

class MunicipiumDmsSubmenu extends Equatable {
  final String? eatery;
  final String? host;
  final String? poi;
  final String? experience;

  const MunicipiumDmsSubmenu(
      {this.eatery, this.host, this.poi, this.experience});

  @override
  // TODO: implement props
  List<Object?> get props => [eatery, host, poi, experience];
}
