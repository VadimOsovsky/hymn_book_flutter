import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hymnbook/screens/home/delegates/search_hymns_delegate.dart';
import 'package:hymnbook/screens/home/state/home_state.dart';
import 'package:hymnbook/store/app_state.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatefulWidget {
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final _duration = Duration(milliseconds: 300);
  HomeState _homeState;

  @override
  Widget build(BuildContext context) {
    _homeState = Provider.of<HomeState>(context);

    return SliverAppBar(
      floating: true,
      snap: true,
      forceElevated: true,
      title: Observer(
        builder: (_) => _homeState.selectedHymnIds.length > 0
            ? Text("Selected: ${_homeState.selectedHymnIds.length}")
            : Text(
          SingletonStore.instance.appName,
          style: TextStyle(fontFamily: "Caveat", fontSize: 32.0),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => showSearch(
            context: context,
            delegate: SearchHymnsDelegate(),
          ),
        )
      ],
    );
  }
}
