import 'package:equatable/equatable.dart';

class IssueCategoryTag extends Equatable {
  final int id;
  final String name;
  final String description;
  final bool mandatoryMessage;
  final bool isSelectable;
  final List<int> tags;

  const IssueCategoryTag(
      {required this.id,
      required this.name,
      required this.description,
      required this.mandatoryMessage,
      required this.isSelectable,
      required this.tags});

  @override
  List<Object?> get props =>
      [id, name, description, mandatoryMessage, isSelectable, tags];
}
