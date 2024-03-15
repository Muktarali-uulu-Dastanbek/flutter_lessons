import 'package:flutter/material.dart';
import 'package:modelka/models/user_model.dart';
import 'package:modelka/screens/user_detail_screen.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Сотрудники",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextField(),
          SizedBox(height: 12),
          Text(
            "У кого сегодня день рождения",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 87,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: todayBirthdayList.length,
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.green,
                    child: Image.asset(todayBirthdayList[index].avatar));
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 19);
              },
            ),
          ),
          Text(
            "У кого завтра день рождения",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 87,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tomorrowBirthdayList.length,
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.green,
                    child: Image.asset(tomorrowBirthdayList[index].avatar));
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 19);
              },
            ),
          ),
          Text(
            "Все сотрудники",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: allUsersList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDeatilScreen(
                        userModel: allUsersList[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 11,
                    horizontal: 16,
                  ),
                  height: 64,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Image.asset(allUsersList[index].avatar),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          "${allUsersList[index].surname} ${allUsersList[index].name} ${allUsersList[index].patronymic}",
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16);
            },
          )
        ],
      ),
    );
  }
}
