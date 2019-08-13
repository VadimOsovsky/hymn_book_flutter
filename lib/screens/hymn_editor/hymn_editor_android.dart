import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/screens/hymn_editor/state/hymn_editor_state.dart';
import 'package:hymnbook/screens/hymn_editor/tabs/hymn_info_tab.dart';
import 'package:hymnbook/screens/hymn_editor/tabs/lyrics_tab.dart';
import 'package:provider/provider.dart';

class HymnEditorAndroid extends StatelessWidget {
  final Hymn hymn;

  HymnEditorAndroid({@required this.hymn});

  final List<Map<String, dynamic>> _tabs = [
    {"title": "Hymn info", "icon": Icons.info_outline, "tab": HymnInfoTab()},
    {"title": "Lyrics", "icon": Icons.text_fields, "tab": LyricsTab()},
  ];

  _initEditorTextFields(HymnEditorState state) {
    state.hymnCoverImage = hymn.hymnCoverImage;
    state.hymnTitleCtrl.text = hymn.title ?? "";
    state.lyricsByCtrl.text = hymn.lyricsBy ?? "";
    state.musicByCtrl.text = hymn.musicBy ?? "";
    state.lyricsCtrl.text = hymn.lyrics ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final hymnEditorState = HymnEditorState();
    _initEditorTextFields(hymnEditorState);

    return Provider(
      builder: (_) => hymnEditorState,
      dispose: (_, val) => val.dispose(),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            body: DefaultTabController(
              length: _tabs.length, // This is the number of tabs.
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      title:
                          Text(hymn.localId != null ? "Edit hymn" : "Add hymn"),
                      floating: true,
                      forceElevated: true,
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.done),
                          onPressed: () => hymnEditorState.onDoneEditing(),
                        ),
                      ],
                      bottom: TabBar(
                        // These are the widgets to put in each tab in the tab bar.
                        tabs: _tabs
                            .map((tab) => Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(tab["icon"]),
                                      SizedBox(width: 10),
                                      Text(tab["title"])
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: _tabs.map((tab) {
                    return SafeArea(
                      top: false,
                      child: Builder(
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: tab["tab"],
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
