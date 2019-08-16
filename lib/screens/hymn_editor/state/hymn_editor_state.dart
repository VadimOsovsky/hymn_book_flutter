import 'package:flutter/widgets.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/store/app_state.dart';
import 'package:mobx/mobx.dart';

part 'hymn_editor_state.g.dart';

class HymnEditorState = _HymnEditorState with _$HymnEditorState;

abstract class _HymnEditorState with Store {

  final _hymnsDao = SingletonStore.instance.db.hymnsDao;

  // for hymn info preview (not dialog)
  @observable
  String hymnCoverImage = "";

  final hymnTitleCtrl = TextEditingController();
  final lyricsByCtrl = TextEditingController();
  final musicByCtrl = TextEditingController();
  final lyricsCtrl = TextEditingController();

  onDoneEditing({@required Function onSuccess}) async {
    final hymn = new Hymn(
      localId: null,
      title: hymnTitleCtrl.text,
      lyrics: lyricsCtrl.text,
      lyricsBy: lyricsByCtrl.value.text,
      musicBy: musicByCtrl.text,
      hymnCoverImage: hymnCoverImage,
      language: _setHymnLanguage(lyricsCtrl.text),
    );

    await _hymnsDao.addToSavedHymns(hymn);
    onSuccess();
  }

  String _setHymnLanguage(lyrics) {
    // TODO
    return "en";
  }
}
