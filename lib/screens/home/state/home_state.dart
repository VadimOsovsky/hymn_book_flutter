import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/store/app_state.dart';
import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  final _hymnsDao = SingletonStore.instance.db.hymnsDao;

  Stream<List<Hymn>> onWatchSavedHymns() {
    return _hymnsDao.watchSavedHymns;
  }

  void onDeleteFromSavedHymns(int localId) async {
    await _hymnsDao.deleteFromSavedHymns(localId);
  }

  onCreateHymn() async {
    final hymn = Hymn(
      localId: null,
      title: "Awesome God",
      lyrics: "[Verse 1]\n" +
          "When He rolls up His sleeves\n" +
          "He ain't just putting on the ritz\n",
      musicBy: "Rich Mullins",
      lyricsBy: "Rich Mullins",
      language: "en",
    );

    await _hymnsDao.addToSavedHymns(hymn);
  }
}
