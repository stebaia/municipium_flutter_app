import 'package:equatable/equatable.dart';

class IssueCategory extends Equatable {
  final int id;
  final String name;

  const IssueCategory({required this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
