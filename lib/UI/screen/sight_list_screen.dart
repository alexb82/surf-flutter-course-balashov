import 'package:flutter/material.dart';
import 'package:places/UI/screen/sight_card.dart';
import 'package:places/common/bottomnavbar.dart';
import 'package:places/common/colors.dart';
import 'package:places/mocks.dart';
import 'package:places/common/styles.dart';

class NotColoredText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Text(
      "Список\nинтересных мест",
      style: stlNormal32AlmostBlack,
      textAlign: TextAlign.left,
    ));
  }
}

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final double height;

  MyAppBar(this.height);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: NotColoredText(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: height,
    );
  }
}

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  List<Widget> _getSightsList() {
    return mocks.map((item) => SightCard(item, 'basic')).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(152),
      body: Container(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            children: _getSightsList(),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
