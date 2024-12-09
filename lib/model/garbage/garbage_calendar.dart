import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/services/network/dto/garbage_calendar_dto.dart';

class GarbageCalendars extends Equatable {
  final int id;
  final String name;
  final String updatedAt;
  final ZoneDTO zone;
  final String calendarTypeName;
  final MunicipiumImage? calendarTypeIcon;
  final MunicipiumImage? calendarTypeIconGrey;

  GarbageCalendars(
      {required this.id,
      required this.name,
      required this.updatedAt,
      required this.zone,
      required this.calendarTypeName,
      this.calendarTypeIcon,
      this.calendarTypeIconGrey});

  @override
  List<Object?> get props => [
        id,
        name,
        updatedAt,
        zone,
        calendarTypeName,
        calendarTypeIcon,
        calendarTypeIconGrey
      ];
}
