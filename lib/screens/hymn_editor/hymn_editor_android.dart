import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/screens/hymn_editor/state/hymn_editor_state.dart';
import 'package:hymnbook/screens/hymn_editor/tabs/hymn_info_tab.dart';
import 'package:hymnbook/screens/hymn_editor/tabs/lyrics_tab.dart';
import 'package:provider/provider.dart';

class HymnEditorAndroid extends StatefulWidget {
  final Hymn hymn;

  HymnEditorAndroid({@required this.hymn});

  @override
  _HymnEditorAndroidState createState() => _HymnEditorAndroidState();
}

class _HymnEditorAndroidState extends State<HymnEditorAndroid> {
  final List<Map<String, dynamic>> _tabs = [
    {"title": "Hymn info", "icon": Icons.info_outline, "tab": HymnInfoTab()},
    {"title": "Lyrics", "icon": Icons.text_fields, "tab": LyricsTab()},
  ];

  final _hymnEditorState = HymnEditorState();

  @override
  void initState() {
    super.initState();
    _initEditorTextFields();
  }

  @override
  void dispose() {
    super.dispose();
    _hymnEditorState.dispose();
  }

  _initEditorTextFields() {
    _hymnEditorState.hymnCoverImage = widget.hymn.hymnCoverImage;
    _hymnEditorState.hymnTitleCtrl.text = widget.hymn.title ?? "";
    _hymnEditorState.lyricsByCtrl.text = widget.hymn.lyricsBy ?? "";
    _hymnEditorState.musicByCtrl.text = widget.hymn.musicBy ?? "";
    _hymnEditorState.lyricsCtrl.text = widget.hymn.lyrics ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => _hymnEditorState,
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
                      title: Text(widget.hymn.localId != null
                          ? "Edit hymn"
                          : "Add hymn"),
//                      floating: true,
//                      forceElevated: true,
//                      snap: true,
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.done),
                          onPressed: () =>
                              _hymnEditorState.onDoneEditing(onSuccess: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          }),
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
