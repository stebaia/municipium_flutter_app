import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipium_image.dart';

class GarbageCalendarElement extends Equatable {
  final int id;
  final String name;
  final String description;
  final String instructions;
  final MunicipiumImage imageWhite;
  final MunicipiumImage imageGreen;
  final MunicipiumImage imageGrey;

  const GarbageCalendarElement(
      {required this.id,
      required this.name,
      required this.description,
      required this.instructions,
      required this.imageWhite,
      required this.imageGreen,
      required this.imageGrey});

  @override
  List<Object?> get props =>
      [id, name, description, instructions, imageWhite, imageGreen, imageGrey];
}
