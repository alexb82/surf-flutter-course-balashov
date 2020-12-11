import 'package:flutter/material.dart';
import 'package:places/UI/screen/sight_list_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task 3.5!",
      home: Material(
        child: SightListScreen(),
      ),
    );
  }
}
