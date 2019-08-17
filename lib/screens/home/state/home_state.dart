import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/store/app_state.dart';
import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  final _hymnsDao = SingletonStore.instance.db.hymnsDao;

  @observable
  Set<int> selectedHymnIds = new Set();

  void onSelectHymn(int id) {
    // reassigning to update the observable
    final selectedIds = selectedHymnIds;
    if (selectedHymnIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    selectedHymnIds = selectedIds;
  }

  Stream<List<Hymn>> onWatchSavedHymns() {
    return _hymnsDao.watchSavedHymns;
  }

  void onDeleteFromSavedHymns(int localId) async {
    await _hymnsDao.deleteFromSavedHymns(localId);
  }
}
