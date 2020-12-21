import 'package:flutter/material.dart';
import 'package:places/common/colors.dart';
import 'package:places/common/styles.dart';
import 'package:places/domain/sight.dart';
import 'package:places/common/texts.dart';

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
            color: clrLightGrey,
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
              style: stlNormalLightGrey,
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
              color: clrAlmostBlack,
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
                style: stlNormalAlmostBlack,
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
              style: stl14Bold,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              'закрыто до 09:00',
              style: stlNormalGrey,
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
        style: stl24Bold,
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
        style: stlNormalAlmostBlack,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
      ),
      child: Divider(
        color: clrLightGrey,
        thickness: 0.8,
      ),
    );
  }

  Widget _buildGallery(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.network(sight.imgsource,
                fit: BoxFit.fitHeight,
                height: 360, loadingBuilder: (BuildContext context,
                    Widget child, ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            }),
          ),
          Padding(
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
        ],
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
          color: clrGreen,
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
                txtBuildRoute.toUpperCase(),
                style: stlBoldWhite,
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
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.5, 64, 0.5, 0),
            child: Container(
              alignment: Alignment.bottomCenter,
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
