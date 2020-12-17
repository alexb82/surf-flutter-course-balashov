import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/common/colors.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  Widget _buildSightType(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildAddToFavIcon(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildSightCardInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Container(
            width: 296,
            alignment: Alignment.topLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 151,
                maxHeight: 62,
              ),
              child: Text(
                sight.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
                style: TextStyle(color: CLRGREY),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                _buildSightType(context),
                _buildAddToFavIcon(context),
              ],
            )),
        SizedBox(
          height: 16,
          child: Container(
            color: CLRDIRTYWHITE,
          ),
        ),
        Container(
          width: double.infinity,
          height: 98,
          decoration: BoxDecoration(
            color: CLRDIRTYWHITE,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          child: _buildSightCardInfo(context),
        ),
      ]),
    );
  }
}
