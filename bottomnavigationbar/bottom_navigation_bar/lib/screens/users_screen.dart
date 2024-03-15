import 'package:bottom_navigation_bar/models/user_model.dart';
import 'package:bottom_navigation_bar/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    name: usersList[index].name,
                    surname: usersList[index].surname,
                    //---------------
                    userModel: usersList[index],
                  ),
                ),
              );
            },
            child: Container(
              height: 70,
              color: Colors.green,
              child:
                  Text("${usersList[index].name} ${usersList[index].surname}"),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 16);
        },
      ),
    );
  }
}
