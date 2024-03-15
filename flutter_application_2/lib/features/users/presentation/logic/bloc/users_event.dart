// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class GetAllUsersEvent extends UsersEvent {}

class GetUserDetailEvent extends UsersEvent {
  final int id;

  GetUserDetailEvent({required this.id});
}
