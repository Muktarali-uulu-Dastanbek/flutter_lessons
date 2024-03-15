import 'dart:convert';

import 'package:async_awaitt/models/post_model.dart';
// import 'package:async_awaitt/screens/post_by_id_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostByIdScreen extends StatefulWidget {
  final int id;

  const PostByIdScreen({super.key, required this.id});

  @override
  State<PostByIdScreen> createState() => _PostByIdScreenState();
}

class _PostByIdScreenState extends State<PostByIdScreen> {
  PostModel postModel = PostModel(
    id: 0,
    userId: 10,
    title: "testTitle",
    body: "testBody",
  );

  @override
  void initState() {
    getPostsById(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Detail Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(postModel.id.toString()),
          Text(postModel.userId.toString()),
          Text(postModel.title ?? ""),
          Text(postModel.body ?? ""),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPostsById(id: widget.id);
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  getPostsById({required int id}) async {
    try {
      var url = Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts/$id',
      );

      var response = await http.get(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        postModel = PostModel.fromJson(json.decode(response.body));
        setState(() {});
      }
    } catch (e) {
      print('error is $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("error is $e"),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
