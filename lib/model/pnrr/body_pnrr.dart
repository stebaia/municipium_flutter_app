import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/pnrr_body_dto.dart';

class BodyPnrr extends Equatable {
  List<String>? values;
  String? name;
  String? type;
  String? value;
  String? urlPrenotazione;
  String? url;
  List<ContentPnrr>? content;

  BodyPnrr(
      {this.values,
      this.name,
      this.type,
      this.value,
      this.urlPrenotazione,
      this.url,
      this.content});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [values, name, type, value, urlPrenotazione, url, content];
}
