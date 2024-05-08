import 'package:equatable/equatable.dart';

class IssueTag extends Equatable {
  final int id;
  final String description;
  final String name;

  const IssueTag(
      {required this.id, required this.name, required this.description});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description];
}
