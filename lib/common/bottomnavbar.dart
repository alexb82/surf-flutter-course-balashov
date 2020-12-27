import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.memory), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.memory), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.memory), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.memory), label: ''),
      ],
    );
  }
}
