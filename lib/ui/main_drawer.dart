import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("User"),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
          )
        ],
      ),
    );
  }
}
