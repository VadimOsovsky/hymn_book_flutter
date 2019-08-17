import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hymnbook/screens/add_hymn/add_hymn_android.dart';
import 'package:hymnbook/screens/add_hymn/add_hymn_route.dart';
import 'package:hymnbook/screens/home/home_android.dart';
import 'package:hymnbook/screens/home/home_route.dart';
import 'package:hymnbook/screens/hymn_editor/hymn_editor_android.dart';
import 'package:hymnbook/screens/hymn_editor/hymn_editor_route.dart';
import 'package:hymnbook/screens/hymn_view/hymn_view_android.dart';
import 'package:hymnbook/screens/hymn_view/hymn_view_route.dart';
import 'package:hymnbook/ui/fade_route.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute.name:
      return MaterialPageRoute(builder: (context) => HomeAndroid());

    case HymnEditorRoute.name:
      final HymnEditorScreenArguments args = settings.arguments;
      return MaterialPageRoute(builder: (context) => HymnEditorAndroid(hymn: args.hymn));

    case AddHymnRoute.name:
      return FadeRoute(page: AddHymnAndroid());

    case HymnViewRoute.name:
      final HymnViewScreenArgs args = settings.arguments;
      return MaterialPageRoute(builder: (context) =>  HymnViewAndroid(hymn: args.hymn));

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }
}