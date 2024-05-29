import 'package:equatable/equatable.dart';

class ServicePnrr extends Equatable {
  List<String>? categoria;
  List<String>? argomenti;
  String? url;
  String? title;
  String? shortDescription;
  String? itemType;
  int? sitePageId;
  ServicePnrr(
      {required this.categoria,
      required this.argomenti,
      required this.url,
      required this.title,
      required this.shortDescription,
      required this.itemType,
      required this.sitePageId});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
