part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class FetchingListIdpState extends UserState {
  const FetchingListIdpState();
}

class FetchedListIdpState extends UserState {
  final List<IdpModel> idps;
  const FetchedListIdpState(this.idps);
}

class NoListIdpState extends UserState {
  const NoListIdpState();
}


