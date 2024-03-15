// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lesson999/models/post_model.dart';
// import 'package:lesson999/screens/posts/bloc/posts_bloc.dart';

// class AllPostsScreen extends StatefulWidget {
//   const AllPostsScreen({super.key});

//   @override
//   State<AllPostsScreen> createState() => _AllPostsScreenState();
// }

// class _AllPostsScreenState extends State<AllPostsScreen> {
//   List<PostModel> postsList = [];
//   final PostsBloc postsBloc = PostsBloc();

//   @override
//   void initState() {
//     postsBloc.add(GetAllPostsEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("All posts"),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: BlocListener<PostsBloc, PostsState>(
//         bloc: postsBloc,
//         listener: (context, state) {
//           if (state is PostsLoadedState) {
//             postsList = state.postsModelList;

//             setState(() {});

//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Screen1(),
//               ),
//             );
//           }

//           if (state is PostsErrorState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("Произошла ошибка"),
//               ),
//             );
//           }
//         },
//         child: ListView.separated(
//           itemCount: postsList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               color: Colors.red,
//               child: Column(
//                 children: [
//                   Text(postsList[index].id.toString()),
//                   Text(postsList[index].userId.toString()),
//                   Text(postsList[index].title.toString()),
//                   Text(postsList[index].body.toString()),
//                 ],
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return SizedBox(height: 16);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart';
import 'package:lesson999/models/post_model.dart';
import 'package:lesson999/screens/posts/bloc/posts_bloc.dart';
import 'package:lesson999/screens/posts/post_detail_screen.dart';

class AllPostsScreen extends StatefulWidget {
  const AllPostsScreen({super.key});

  @override
  State<AllPostsScreen> createState() => _AllPostsScreenState();
}

class _AllPostsScreenState extends State<AllPostsScreen> {
  List<PostModel> postsList = [];
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(GetAllPostsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All posts"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listener: (context, state) {
          if (state is PostsLoadedState) {
            postsList = state.postsModelList;
          }

          if (state is PostsErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Произошла ошибка"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PostsErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  postsBloc.add(GetAllPostsEvent());
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

          if (state is PostsLoadedState) {
            return RefreshIndicator(
              onRefresh: () async {
                postsBloc.add(GetAllPostsEvent());
              },
              child: ListView.separated(
                itemCount: postsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetailScreen(
                                    id: postsList[index].id,
                                  )));
                    },
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text(postsList[index].id.toString()),
                          Text(postsList[index].userId.toString()),
                          Text(postsList[index].title.toString()),
                          Text(postsList[index].body.toString()),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
