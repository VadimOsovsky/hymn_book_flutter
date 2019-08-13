import 'package:flutter/cupertino.dart';
import 'package:hymnbook/data/app_db.dart';

class HymnViewRoute {
  static const name = "hymn_view";
}

class HymnViewScreenArgs {
  final Hymn hymn;

  HymnViewScreenArgs({@required this.hymn});
}