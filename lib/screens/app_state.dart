import 'package:flutter/widgets.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/data/hymns/hymns_dao.dart';

class AppState with ChangeNotifier {
  static final _db = AppDatabase();
  String get appName => "Hymn Book";

  AppDatabase get db => _db;
}
