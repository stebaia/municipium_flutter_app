part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchListIdpEvent extends UserEvent {
  const FetchListIdpEvent();
}


class FetchUserDataEvent extends UserEvent {
  final String authId;
  final String municipalityId;
  final String authSystem;
  final String authIdOld;
  const FetchUserDataEvent(this.authId, this.municipalityId, this.authSystem, this.authIdOld);
}



