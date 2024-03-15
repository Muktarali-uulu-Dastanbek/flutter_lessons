import 'dart:convert';

import 'package:async_awaitt/models/post_model.dart';
import 'package:async_awaitt/screens/post_by_id_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<PostModel> postsModelList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemCount: postsModelList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PostByIdScreen(id: postsModelList[index].id ?? 0),
                ),
              );
            },
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  Text("Id: ${postsModelList[index].id}"),
                  Text("UserId: ${postsModelList[index].userId}"),
                  Text("title: ${postsModelList[index].title}"),
                  Text("body: ${postsModelList[index].body}"),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPosts();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  ///функция для стягивания постов
  getPosts() async {
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

        print("parsedList = $parsedList");

        postsModelList =
            parsedList.map<PostModel>((e) => PostModel.fromJson(e)).toList();

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
