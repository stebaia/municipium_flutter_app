part of 'user_data_cubit.dart';

sealed class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserDataState {}
