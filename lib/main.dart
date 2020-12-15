import 'package:flutter/material.dart';
import 'package:places/UI/screen/sightdetails.dart';
import 'package:places/UI/screen/sight_list_screen.dart';
import 'package:places/mocks.dart';

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
