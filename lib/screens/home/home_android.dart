import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/screens/add_hymn/add_hymn_route.dart';
import 'package:hymnbook/screens/home/components_android/home_app_bar.dart';
import 'package:hymnbook/screens/home/state/home_state.dart';
import 'package:provider/provider.dart';

import 'components_android/hymn_item.dart';

class HomeAndroid extends StatefulWidget {
  @override
  _HomeAndroidState createState() => _HomeAndroidState();
}

class _HomeAndroidState extends State<HomeAndroid> {
  final _homeState = HomeState();

  @override
  void dispose() {
    super.dispose();
    _homeState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notificationsNum = 3;

    return Provider(
      builder: (_) => _homeState,
      child: Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          HomeAppBar(),
          StreamBuilder<List<Hymn>>(
            stream: _homeState.onWatchSavedHymns(),
            builder: _buildSavedHymns,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Add Hymn",
          onPressed: () => Navigator.pushNamed(context, AddHymnRoute.name),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          // elevation: 20.0,

          shape: CircularNotchedRectangle(),
          child: Container(
            height: 55,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.settings),
                  tooltip: "Settings",
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.people),
                  tooltip: "My Groups",
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30.0,
                ),
                Badge(
                  shape: notificationsNum > 10
                      ? BadgeShape.square
                      : BadgeShape.circle,
                  borderRadius: 50,
                  showBadge: notificationsNum > 0,
                  badgeContent: Text(
                      notificationsNum > 99
                          ? "99+"
                          : notificationsNum.toString(),
                      style: TextStyle(color: Colors.white)),
                  position: BadgePosition(
                      right: notificationsNum > 99 ? -8 : 0, top: 0),
                  child: IconButton(
                    iconSize: 30.0,
                    icon: Icon(Icons.notifications),
                    tooltip: "Notifications",
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.list),
                  tooltip: "Menu",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSavedHymns(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.active) {
      if (snapshot.hasData && snapshot.data.length > 0) {
        return SliverPadding(
          padding: EdgeInsets.only(bottom: 32.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HymnItem(
                key: Key(index.toString()),
                hymn: snapshot.data[index],
              ),
              childCount: snapshot.data.length,
            ),
          ),
        );
      } else {
        return SliverFillRemaining(child: Center(child: Text('Empty here...')));
      }
    } else if (snapshot.hasError) {
      return SliverFillRemaining(
        child: Center(
          child: Text(
            snapshot.error,
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    } else {
      return SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()));
    }
  }
}
