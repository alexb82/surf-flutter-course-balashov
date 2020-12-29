import 'package:flutter/material.dart';
import 'package:places/common/colors.dart';

class MyBottomNavItem {
  final double width;
  final double height;
  final int index;

  MyBottomNavItem(this.index, this.width, this.height);
}


class MyBottomNavBar extends StatefulWidget {
  void onChange(int i) => print(i);
  final List<MyBottomNavItem> children;

  MyBottomNavBar(this.children);

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
            children: widget.children.map((btn) {
              return InkWell(
                onTap: () {
                  _changeIndex(btn.index);
                },
                child: Container(
                  color: Colors.black,
                  width: btn.width,
                  height: btn.height,
                ),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
