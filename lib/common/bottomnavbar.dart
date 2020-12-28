import 'package:flutter/material.dart';
import 'package:places/common/colors.dart';

class MyBottomNavBar extends StatefulWidget {
  void onChange(int i) => print(i);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 57,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Divider(
          color: clrLightGrey,
          height: 1,
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _changeIndex(0);
                },
                child: Container(
                  color: Colors.black,
                  width: 20,
                  height: 22,
                ),
              ),
              InkWell(
                onTap: () {
                  _changeIndex(1);
                },
                child: Container(
                  color: Colors.black,
                  width: 20,
                  height: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  _changeIndex(2);
                },
                child: Container(
                  color: Colors.black,
                  width: 22,
                  height: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  _changeIndex(3);
                },
                child: Container(
                  color: Colors.black,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
