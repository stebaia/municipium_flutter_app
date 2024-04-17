import 'package:equatable/equatable.dart';

class MunicipiumGarbageSubmenu extends Equatable {
  final String? recycling_areas;
  final String? calendars;
  final String? garbage_collections;
  final String? garbage_categories;

  const MunicipiumGarbageSubmenu(
      {this.recycling_areas,
      this.calendars,
      this.garbage_collections,
      this.garbage_categories});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [recycling_areas, calendars, garbage_collections, garbage_categories];
}
