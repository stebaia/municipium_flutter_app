part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchListIdpEvent extends UserEvent {
  String baseUrl;
  FetchListIdpEvent(this.baseUrl);
}

class FetchUserDataEvent extends UserEvent {
  String baseUrl;
  final String authId;
  final String municipalityId;
  final String authSystem;
  final String authIdOld;
  FetchUserDataEvent(this.baseUrl, this.authId, this.municipalityId,
      this.authSystem, this.authIdOld);
}
