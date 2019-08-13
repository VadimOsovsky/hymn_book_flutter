import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hymnbook/navigation/routes.dart';
import 'package:hymnbook/screens/home/home_route.dart';
import 'package:hymnbook/store/app_state.dart';
import 'package:hymnbook/theming/app_themes.dart';

class App extends StatelessWidget {
  final _appState = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return MaterialApp(
        title: _appState.appName,
        theme: AppThemes.material,
        debugShowCheckedModeBanner: false,
        initialRoute: HomeRoute.name,
        onGenerateRoute: onGenerateRoute,
      );
    } else if (Platform.isIOS) {
      return CupertinoApp(
        title: _appState.appName,
        theme: AppThemes.cupertino,
        debugShowCheckedModeBanner: false,
        home: Center(child: Text('Hello World!')),
      );
    } else {
      return Text("Your platform is not yet supported :(");
    }
  }
}
