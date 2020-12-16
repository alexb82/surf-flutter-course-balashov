import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(children: [
        Container(
            width: double.infinity,
            height: 96,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    left: 16,
                    top: 16,
                  ),
                  child: Text(
                    sight.type.toLowerCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(
                    top: 19,
                    right: 18,
                  ),
                  child: Container(
                    width: 20,
                    height: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
        Container(
          width: double.infinity,
          height: 92,
          color: Color(0xFFF5F5F5),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                Container(
                  width: 296,
                  child: Text(
                    sight.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    width: 296,
                    margin: EdgeInsets.only(
                      top: 2,
                    ),
                    child: Text(
                      sight.url,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Color(0xFF7C7E92)),
                    ))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
