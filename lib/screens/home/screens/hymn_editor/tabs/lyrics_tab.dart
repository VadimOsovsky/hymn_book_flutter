import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../hymn_editor_state.dart';

class LyricsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hymnEditorState = Provider.of<HymnEditorState>(context);

    return Column(
      children: <Widget>[
        TextField(
          controller: hymnEditorState.lyricsCtrl,
          maxLines: null,
          decoration: InputDecoration.collapsed(
            hintText: "Enter lyrics here..."
          ),
        )
      ],
    );
  }
}
