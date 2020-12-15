import 'package:flutter/material.dart';
import 'package:places/UI/screen/sight_card.dart';
import 'package:places/mocks.dart';

class NotColoredText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Text(
      "Список\nинтересных мест",
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: 32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3B3E5B),
      ),
      textAlign: TextAlign.left,
    ));
  }
}

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  List<Widget> _getSightsList() {
    return new List<Widget>.generate(mocks.length, (int index) {
      return SightCard(mocks[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: NotColoredText(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 128,
      ),
      body: Container(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            children: _getSightsList(),
          ),
        ),
      ),
    );
  }
}
