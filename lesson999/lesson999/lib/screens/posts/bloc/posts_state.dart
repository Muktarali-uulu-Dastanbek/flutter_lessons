// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  final List<PostModel> postsModelList;

  PostsLoadedState({required this.postsModelList});
}

class PostDetailLoadedState extends PostsState {
  final PostModel postModel;

  PostDetailLoadedState({required this.postModel});
}

class PostsErrorState extends PostsState {}
