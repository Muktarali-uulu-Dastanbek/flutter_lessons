import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson999/models/post_model.dart';
import 'package:lesson999/screens/posts/bloc/posts_bloc.dart';

class PostDetailScreen extends StatefulWidget {
  final int? id;
  const PostDetailScreen({super.key, required this.id});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  PostsBloc postsBloc = PostsBloc();
  PostModel postModel = PostModel();

  @override
  void initState() {
    postsBloc.add(GetPostDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Detail Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        bloc: postsBloc,
        builder: (context, state) {
          if (state is PostsErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  postsBloc.add(GetPostDetailEvent(id: widget.id));
                },
                child: Text("Повторить"),
              ),
            );
          }

          if (state is PostsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostDetailLoadedState) {
            postModel = state.postModel;
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Text("${postModel.id}"),
                Text("${postModel.userId}"),
                Text("${postModel.title}"),
                Text("${postModel.body}"),
              ]),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
