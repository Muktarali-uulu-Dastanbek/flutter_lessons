import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:lesson999/models/post_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitialState()) {
    on<GetAllPostsEvent>((event, emit) async {
      emit(PostsLoadingState());

      try {
        var url = Uri.https(
          'jsonplaceholder.typicode.com',
          '/posts',
        );

        var response = await http.get(url);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          List parsedList = json.decode(response.body);

          final postModelList =
              parsedList.map<PostModel>((e) => PostModel.fromJson(e)).toList();

          emit(PostsLoadedState(postsModelList: postModelList));
        }
      } catch (e) {
        emit(PostsErrorState());
      }
    });
    on<GetPostDetailEvent>((event, emit) async {
      emit(PostsLoadingState());

      try {
        var url = Uri.https(
          'jsonplaceholder.typicode.com',
          '/posts/${event.id}',
        );

        var response = await http.get(url);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          var parsed = json.decode(response.body);
          final ppostModel = PostModel.fromJson(parsed);

          // final postModel = parsed.map<PostModel>((e) => PostModel.fromJson(e));

          emit(PostDetailLoadedState(postModel: ppostModel));
        }
      } catch (e) {
        emit(PostsErrorState());
      }
    });
  }
}
