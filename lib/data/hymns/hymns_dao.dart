import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/data/hymns/hymns_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'hymns_dao.g.dart';

@UseDao(tables: [Hymns])
class HymnsDao extends DatabaseAccessor<AppDatabase> with _$HymnsDaoMixin {
  HymnsDao(AppDatabase db) : super(db);

  Stream<List<Hymn>> get watchSavedHymns => select(hymns).watch();

  Future<int> addToSavedHymns(Hymn entry) {
    return into(hymns).insert(entry);
  }
  
  Future deleteFromSavedHymns(int localId) {
    return (delete(hymns)..where((hymn) => hymn.localId.equals(localId))).go();
  }
}
