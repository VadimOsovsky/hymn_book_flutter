import 'package:flutter/material.dart';
import 'package:hymnbook/screens/home/components_android/hymn_cover_image.dart';
import 'package:hymnbook/screens/home/screens/hymn_editor/dialogs/hymn_cover_image_dialog.dart';
import 'package:provider/provider.dart';

import '../hymn_editor_state.dart';

class HymnInfoTab extends StatelessWidget {
  Widget _buildImageDialog(BuildContext context, String initialImageUrl) {
    return HymnCoverImageDialog(initialImageUrl: initialImageUrl);
  }

  @override
  Widget build(BuildContext context) {
    final hymnEditorState = Provider.of<HymnEditorState>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        HymnCoverImage(
          imageUrl: hymnEditorState.hymnCoverImage,
          size: 140.0,
        ),
        SizedBox(height: 10),
        FlatButton(
          child: Text("Set cover image"),
          onPressed: () async {
            String result = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => _buildImageDialog(
                  context, hymnEditorState.hymnCoverImage),
            );
            if (result != null) hymnEditorState.hymnCoverImage = result;
          },
        ),
        SizedBox(height: 20),
        TextField(
          controller: hymnEditorState.hymnTitleCtrl,
          decoration: const InputDecoration(
            icon: Icon(Icons.title),
            hintText: 'Hymn title',
            labelText: 'Title',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: hymnEditorState.lyricsByCtrl,
          decoration: const InputDecoration(
            icon: Icon(Icons.text_fields),
            hintText: 'Lyrics author',
            labelText: 'Lyrics by',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: hymnEditorState.musicByCtrl,
          decoration: const InputDecoration(
            icon: Icon(Icons.music_note),
            hintText: 'Music author',
            labelText: 'Music by',
          ),
        )
      ],
    );
  }
}
