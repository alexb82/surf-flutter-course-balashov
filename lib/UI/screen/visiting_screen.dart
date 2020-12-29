import 'package:flutter/material.dart';
import 'package:places/UI/screen/sight_card.dart';
import 'package:places/common/bottomnavbar.dart';
import 'package:places/common/bottomnavbaritems.dart';
import 'package:places/common/colors.dart';
import 'package:places/common/texts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/common/styles.dart';

Widget _buildAppBarTitle(BuildContext context) {
  return Text(
    txtFav,
    style: stlNormal18AlmostBlack,
    textAlign: TextAlign.center,
  );
}

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final double height;

  MyAppBar(this.height);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppBar(
        title: Container(
          height: 80,
          alignment: Alignment.bottomCenter,
          child: _buildAppBarTitle(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
      ),
      Container(
        width: double.infinity,
        height: 52,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Container(
            color: clrDirtyWhite,
            child: TabBar(
              automaticIndicatorColorAdjustment: false,
              unselectedLabelColor: clrGrey,
              indicator: BoxDecoration(
                color: clrGrey,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              tabs: [
                Tab(
                  text: txtWantAttend,
                ),
                Tab(
                  text: txtAttended,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  List<Widget> _getFavList() {
    List temp = mocks
        .where((element) => element.planned != '')
        .map((item) => SightCard(item, CardType.fav))
        .toList();
    return temp.isEmpty ? _buildEmptyFavList(context) : temp;
  }

  List<Widget> _getDoneList() {
    List temp = mocks
        .where((element) => element.visited != '')
        .map((item) => SightCard(item, CardType.done))
        .toList();
    return temp.isEmpty ? _buildEmptyDoneList(context) : temp;
  }

  List<Widget> _buildEmptyFavList(BuildContext context) {
    List<Widget> temp = new List();
    temp.add(Container(
      padding: EdgeInsets.only(top: 184),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 53,
              height: 48,
              color: clrLightGrey,
            ),
            Container(
              padding: EdgeInsets.only(top: 32),
              child: Text(
                txtEmpty,
                style: stlNormal18LightGrey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                txtEmptyFav,
                style: stlNormal14LightGrey,
              ),
            ),
          ],
        ),
      ),
    ));
    return temp;
  }

  List<Widget> _buildEmptyDoneList(BuildContext context) {
    List<Widget> temp = new List();
    temp.add(Container(
      padding: EdgeInsets.only(top: 184),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 53,
              height: 48,
              color: clrLightGrey,
            ),
            Container(
              padding: EdgeInsets.only(top: 32),
              child: Text(
                txtEmpty,
                style: stlNormal18LightGrey,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                txtEmptyVisited,
                style: stlNormal14LightGrey,
              ),
            ),
          ],
        ),
      ),
    ));
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(132),
        body: TabBarView(children: [
          Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                children: _getFavList(),
              ),
            ),
          ),
          Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                children: _getDoneList(),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: MyBottomNavBar(BTNS),
      ),
    );
  }
}
