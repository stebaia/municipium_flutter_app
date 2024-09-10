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

class FetchingUserDataState extends UserState {
  const FetchingUserDataState();
}


class FetchedUserDataState extends UserState {
  final SpidUserModel userSpidModel;
  const FetchedUserDataState(this.userSpidModel);
}

class NoSpidUserState extends UserState {
  const NoSpidUserState();
}


