// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class GetAllPostsEvent extends PostsEvent {}

class GetPostDetailEvent extends PostsEvent {
  final int? id;

  GetPostDetailEvent({required this.id});
}
