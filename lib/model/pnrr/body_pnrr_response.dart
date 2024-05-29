import 'package:equatable/equatable.dart';
import 'package:municipium/model/pnrr/body_pnrr.dart';
import 'package:municipium/services/network/dto/pnrr_body_dto.dart';

class BodyPnrrResponse extends Equatable {
  String? subtitle;
  int? id;
  bool? state;
  String? shortDescription;
  String? title;
  List<BodyPnrr>? body;
  List<ArgomentoPnrr>? argomenti;

  BodyPnrrResponse(
      {required this.subtitle,
      required this.id,
      required this.state,
      required this.shortDescription,
      required this.title,
      required this.body,
      required this.argomenti});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [subtitle, id, state, shortDescription, title, body, argomenti];
}
