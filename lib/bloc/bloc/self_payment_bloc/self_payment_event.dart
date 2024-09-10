part of 'self_payment_bloc.dart';

abstract class SelfPaymentEvent extends Equatable {
  const SelfPaymentEvent();

  @override
  List<Object> get props => [];
}

class FetchSelfPaymentEvent extends SelfPaymentEvent {
  final String baseUrl;
  final String ente;
  final String? area;
  final String? codice;
  const FetchSelfPaymentEvent(this.baseUrl, this.ente, this.area, this.codice);
}

class FilterSelfPaymentEvent extends SelfPaymentEvent {
  final String searchText;

  const FilterSelfPaymentEvent(this.searchText);
  @override
  List<Object> get props => [searchText];
}
