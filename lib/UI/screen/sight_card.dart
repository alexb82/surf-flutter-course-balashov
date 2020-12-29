import 'package:flutter/material.dart';
import 'package:places/common/texts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/common/colors.dart';
import 'package:places/common/styles.dart';

enum CardType {
  basic,
  fav,
  done,
}

class SightCard extends StatelessWidget {
  final Sight sight;

  final cardType;

  SightCard(this.sight, this.cardType);

  Widget _buildSightImg(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        height: 96,
        child: Image.network(sight.imgsource, fit: BoxFit.fitWidth,
            loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent loadingProgress,
        ) {
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
    );
  }

  Widget _buildSightType(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: 16,
        top: 16,
      ),
      child: Text(
        sight.type.toLowerCase(),
        style: stlNormalWhite,
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

  Widget _buildFavCardIcons(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        top: 18.5,
        left: 249,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 22,
          height: 19,
          color: Colors.white,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 28,
          ),
          width: 12,
          height: 12,
          color: Colors.white,
        ),
      ]),
    );
  }

  Widget _buildDoneCardIcons(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        top: 19,
        left: 250,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 24,
          height: 24,
          color: Colors.white,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: 28,
          ),
          width: 12,
          height: 12,
          color: Colors.white,
        ),
      ]),
    );
  }

  Widget _buildIcons(BuildContext context) {
    switch (cardType) {
      case CardType.basic:
        return _buildAddToFavIcon(context);
        break;
      case CardType.fav:
        return _buildFavCardIcons(context);
        break;
      case CardType.done:
        return _buildDoneCardIcons(context);
        break;
      default:
        return _buildAddToFavIcon(context);
        break;
    }
  }

  Widget _buildAttendInfo(BuildContext) {
    switch (cardType) {
      case CardType.basic:
        return SizedBox.shrink();
        break;
      case CardType.fav:
        return Container(
            width: 296,
            height: 28,
            margin: EdgeInsets.only(
              top: 2,
            ),
            child: Text(
              txtPlannedAt + sight.planned,
              textAlign: TextAlign.left,
              style: stlNormalGreen,
            ));
        break;
      case CardType.done:
        return Container(
            width: 296,
            height: 28,
            margin: EdgeInsets.only(
              top: 2,
            ),
            child: Text(
              txtVisitedAt + sight.visited,
              textAlign: TextAlign.left,
              style: stlNormalGrey,
            ));
        break;
      default:
        return SizedBox.shrink();
        break;
    }
  }

  Widget _buildSightCardInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
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
                style: stl16Bold,
              ),
            ),
          ),
          Container(
            child: _buildAttendInfo(BuildContext),
          ),
          Container(
              width: 296,
              margin: EdgeInsets.only(
                top: 2,
              ),
              child: Text(
                sight.url,
                textAlign: TextAlign.left,
                style: stlNormalGrey,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(children: [
          Container(
              child: Stack(
            children: [
              _buildSightImg(context),
              _buildSightType(context),
              _buildIcons(context),
            ],
          )),
          SizedBox(
            height: 16,
            child: Container(
              color: clrDirtyWhite,
            ),
          ),
          Container(
            width: double.infinity,
            height: 98,
            decoration: BoxDecoration(
              color: clrDirtyWhite,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            child: _buildSightCardInfo(context),
          ),
        ]),
      ),
    );
  }
}
