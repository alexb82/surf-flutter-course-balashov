import 'package:flutter/material.dart';
import 'package:places/common/colors.dart';
import 'package:places/domain/sight.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  SightDetails(this.sight);

  Widget _buildPlanButton(BuildContext context) {
    return Container(
      width: 164,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 22,
            height: 19,
            color: CLRLIGHTGREY,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              top: 10.5,
              left: 17,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 9,
              top: 10.5,
            ),
            child: Text(
              'Запланировать',
              style: TextStyle(
                color: CLRLIGHTGREY,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16,
      ),
      child: Container(
        width: 164,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 18,
              color: CLRALMOSTBLACK,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                top: 11,
                left: 26,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                left: 10,
                top: 10.5,
              ),
              child: Text(
                'В Избранное',
                style: TextStyle(
                  color: CLRALMOSTBLACK,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSightAdditionalButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPlanButton(context),
          _buildFavButton(context),
        ],
      ),
    );
  }

  Widget _buildSightAddInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2,
      ),
      child: Row(
        children: [
          Container(
            child: Text(
              sight.type,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              'закрыто до 09:00',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: CLRGREY,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSightName(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        sight.name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSightDetails(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        top: 24,
      ),
      child: Text(
        sight.details,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
      ),
      child: Divider(
        color: CLRLIGHTGREY,
        thickness: 0.8,
      ),
    );
  }

  Widget _buildGallery(BuildContext context) {
    return Container(
      height: 360,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          top: 36,
        ),
        child: Container(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 32.0,
            height: 32.0,
            child: const DecoratedBox(
              decoration: const BoxDecoration(color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRouteButton(BuildContext context) {
    return Padding(
      //Button route
      padding: EdgeInsets.only(
        top: 24,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
          color: CLRGREEN,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 18,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'ПОСТРОИТЬ МАРШРУТ',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.5, 64, 0.5, 0),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height - 64,
              color: Colors.white,
              child: Container(
                //content here
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  left: 16,
                  top: 320,
                  right: 16,
                ),
                child: Column(
                  children: [
                    _buildSightName(context),
                    _buildSightAddInfo(context),
                    _buildSightDetails(context),
                    _buildRouteButton(context),
                    _buildDivider(context),
                    _buildSightAdditionalButtons(context),
                  ],
                ),
              ),
            ),
          ),
          _buildGallery(context),
        ],
      ),
    );
  }
}
