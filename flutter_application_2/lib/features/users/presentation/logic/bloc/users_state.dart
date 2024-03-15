// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UserModel> usersModelList;

  UsersLoadedState({required this.usersModelList});
}

class UserDetailLoadedState extends UsersState {
  final UserModel userModel;

  UserDetailLoadedState({required this.userModel});
}

class UsersErrorState extends UsersState {
  final CatchException error;

  UsersErrorState({required this.error});
}
