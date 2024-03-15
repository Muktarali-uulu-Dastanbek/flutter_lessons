// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bottom_navigation_bar/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final String name;
  final String surname;

  //------------
  final UserModel userModel;

  const UserDetailScreen({
    required this.userModel,
    Key? key,
    required this.name,
    required this.surname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.of(context).pop();
          },
        ),
        title: Text(userModel.surname),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
