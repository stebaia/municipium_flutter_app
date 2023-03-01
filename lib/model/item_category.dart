import 'package:equatable/equatable.dart';

class ItemCategory extends Equatable {

  final int id;
  final String name;
  final String? color;
  
  const ItemCategory({
    required this.id,
    required this.name,
    required this.color
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    color
  ];

}