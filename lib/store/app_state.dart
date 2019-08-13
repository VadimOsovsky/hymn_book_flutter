import 'package:hymnbook/data/app_db.dart';
import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class SingletonStore {
  static final AppState instance = new AppState();
}

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  final _db = AppDatabase();

  AppDatabase get db => _db;

  String get appName => "Hymn Book";
}
