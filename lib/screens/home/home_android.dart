import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/screens/app_state.dart';
import 'package:hymnbook/screens/home/screens/add_hymn/add_hymn_android.dart';
import 'package:hymnbook/ui/fade_route.dart';
import 'package:provider/provider.dart';

import 'components_android/hymn_item.dart';
import 'delegates/search_hymns_delegate.dart';
import 'home_state.dart';

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
    final hymnsDao = Provider.of<AppState>(context).db.hymnsDao;
    final notificationsNum = 3;

    return ChangeNotifierProvider(
      builder: (context) => _homeState,
      child: Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            forceElevated: true,
            title: Text(
              Provider.of<AppState>(context).appName,
              style: TextStyle(fontFamily: "Caveat", fontSize: 32.0),
            ),
//              centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(
                  context: context,
                  delegate: SearchHymnsDelegate(),
                ),
              )
            ],
          ),
          StreamBuilder<List<Hymn>>(
            stream: hymnsDao.watchSavedHymns,
            builder: _buildSavedHymns,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Add Hymn",
          onPressed: () =>
              Navigator.push(context, FadeRoute(page: AddHymnAndroid())),
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
                  shape: notificationsNum > 10 ? BadgeShape.square : BadgeShape.circle,
                  borderRadius: 50,
                  showBadge: notificationsNum > 0,
                  badgeContent: Text(
                      notificationsNum > 99
                          ? "99+"
                          : notificationsNum.toString(),
                      style: TextStyle(color: Colors.white)),
                  position: BadgePosition(right: notificationsNum > 99 ? -8 : 0, top: 0),
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
