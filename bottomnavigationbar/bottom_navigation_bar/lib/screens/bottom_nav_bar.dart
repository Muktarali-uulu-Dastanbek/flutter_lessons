import 'package:bottom_navigation_bar/screens/home_screen.dart';
import 'package:bottom_navigation_bar/screens/map_screen.dart';
import 'package:bottom_navigation_bar/screens/user_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = const [
    HomeScreen(),
    MapScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        // backgroundColor: Colors.blue,
        // iconSize: 24,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.red,
        // selectedIconTheme: IconThemeData(color: Colors.black),
        // unselectedIconTheme: IconThemeData(color: Colors.purple),
        // selectedLabelStyle:
        // TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
            tooltip: "Map",
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
            tooltip: "Person",
            // backgroundColor: Colors.red,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
