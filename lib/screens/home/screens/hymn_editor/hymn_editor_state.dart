import 'package:flutter/widgets.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/data/hymns/hymns_dao.dart';

class HymnEditorState with ChangeNotifier {
  // for hymn info preview (not dialog)
  String _hymnCoverImage = "";
  String get hymnCoverImage => _hymnCoverImage;
  set hymnCoverImage(value) {
    _hymnCoverImage = value;
    notifyListeners();
  }

  final hymnTitleCtrl = TextEditingController();
  final lyricsByCtrl = TextEditingController();
  final musicByCtrl = TextEditingController();
  final lyricsCtrl = TextEditingController();
  
  onDoneEditing(HymnsDao hymnsDao) {
    final hymn = new Hymn(
      localId: null,
      title: hymnTitleCtrl.text,
      lyrics: lyricsCtrl.text,
      lyricsBy: lyricsByCtrl.value.text,
      musicBy: musicByCtrl.text,
      hymnCoverImage: hymnCoverImage,
      language: _setHymnLanguage(lyricsCtrl.text),
    );
    
    print("VO: hymn, ${hymn}");
//    hymnsDao.addToSavedHymns(hymn);
  }
  
  String _setHymnLanguage(lyrics) {
    // TODO
    return "en";
  }

}
