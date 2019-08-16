import 'package:flutter/material.dart';
import 'package:hymnbook/screens/hymn_editor/state/hymn_editor_state.dart';
import 'package:provider/provider.dart';

class LyricsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hymnEditorState = Provider.of<HymnEditorState>(context);

    return Column(
      children: <Widget>[
        TextField(
          controller: hymnEditorState.lyricsCtrl,
          autofocus: true,
          maxLines: null,
          decoration:
              InputDecoration.collapsed(hintText: "Enter lyrics here..."),
        )
      ],
    );
  }
}
