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

class ValidateUserDataEvent extends UserEvent {
  String baseUrl;
  final SpidUserModel userSpidModel;
  String? codiceAmico;
  int istat;
  String token;
  String service;
  bool privacy;

  ValidateUserDataEvent(this.baseUrl, this.userSpidModel, this.codiceAmico,
      this.istat, this.token, this.service, this.privacy);
}
