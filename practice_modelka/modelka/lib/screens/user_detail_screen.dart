import 'package:flutter/material.dart';
import 'package:modelka/models/user_model.dart';

class UserDeatilScreen extends StatelessWidget {
  final UserModel userModel;
  const UserDeatilScreen({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 50,
            child: Image.asset(userModel.avatar),
          ),
          Text(
            "${userModel.name} ${userModel.surname} ${userModel.patronymic}",
          ),
          Text(userModel.jobTitle),
          UserDetailCard(
            title: "Направление",
            subtitle: userModel.direction,
          ),
          UserDetailCard(
            title: "Направление",
            subtitle: userModel.direction,
          ),
          UserDetailCard(
            title: "Направление",
            subtitle: userModel.direction,
          ),
        ],
      ),
    );
  }
}

class UserDetailCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const UserDetailCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(title),
                      Text(subtitle),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          Divider(
            color: Colors.red,
            height: 0,
          ),
        ],
      ),
    );
  }
}
