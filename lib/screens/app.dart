import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hymnbook/screens/app_state.dart';
import 'package:hymnbook/screens/home/home_android.dart';
import 'package:hymnbook/theming/app_themes.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final _appState = AppState();

  Widget _buildApp(BuildContext context) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return MaterialApp(
        title: _appState.appName,
        theme: AppThemes.material,
        debugShowCheckedModeBanner: false,
        home: HomeAndroid(),
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => _appState,
      child: _buildApp(context),
    );
  }
}
