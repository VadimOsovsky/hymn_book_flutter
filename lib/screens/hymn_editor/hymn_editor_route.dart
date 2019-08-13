import 'package:flutter/cupertino.dart';
import 'package:hymnbook/data/app_db.dart';

class HymnEditorRoute {
  static const name = "hymn_editor";
}

class HymnEditorScreenArguments {
  final Hymn hymn;

  HymnEditorScreenArguments({@required this.hymn});
}