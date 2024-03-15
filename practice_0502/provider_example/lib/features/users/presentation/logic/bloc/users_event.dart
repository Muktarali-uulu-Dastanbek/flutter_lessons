part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class GetAllUsersEvent extends UsersEvent {}

class GetUserByIdEvent extends UsersEvent {
  final int id;

  GetUserByIdEvent({required this.id});
}
