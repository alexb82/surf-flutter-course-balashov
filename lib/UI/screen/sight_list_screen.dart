import 'package:flutter/material.dart';

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

class ColoredText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (RichText(
      text: TextSpan(
        text: "С",
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 32,
          color: Color(0xFF4CAF50),
        ),
        children: [
          TextSpan(
            text: "писок\n",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 32,
              color: Color(0xFF3B3E5B),
            ),
          ),
          TextSpan(
            text: "и",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 32,
              color: Color(0xFFFBC02D),
            ),
          ),
          TextSpan(
            text: "нтересных мест",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 32,
              color: Color(0xFF3B3E5B),
            ),
          ),
        ],
      ),
    ));
  }
}

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  var colored = false;

  void splitColor() {
    setState(() {
      colored = !colored;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: colored ? NotColoredText() : ColoredText(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 128,
      ),
      body: Center(
        child: Text("Sight List Body"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: splitColor, child: Icon(Icons.call_split)),
    );
  }
}
