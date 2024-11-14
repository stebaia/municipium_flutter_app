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

  @override
  List<Object> get props =>
      [baseUrl, authId, municipalityId, authSystem, authIdOld];
}

class LogoutUserDataEvent extends UserEvent {
  final String baseUrlMmc;
  final String playerId;
  final String cf;
  final String udid;

  LogoutUserDataEvent(this.baseUrlMmc, this.playerId, this.cf, this.udid);

  @override
  List<Object> get props => [baseUrlMmc, playerId, cf, udid];
}
