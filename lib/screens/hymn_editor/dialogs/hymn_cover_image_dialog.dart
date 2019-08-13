import 'package:flutter/material.dart';
import 'package:hymnbook/screens/home/components_android/hymn_cover_image.dart';

class HymnCoverImageDialog extends StatefulWidget {
  final initialImageUrl;

  const HymnCoverImageDialog({Key key, this.initialImageUrl}) : super(key: key);

  @override
  _HymnCoverImageDialogState createState() => _HymnCoverImageDialogState();
}

class _HymnCoverImageDialogState extends State<HymnCoverImageDialog> {
  final _imageUrlCtrl = TextEditingController();
  String _imageUrlText = "";


  @override
  void initState() {
    super.initState();
    _imageUrlCtrl.text = widget.initialImageUrl;
    _imageUrlText = widget.initialImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Set cover image"),
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            HymnCoverImage(imageUrl: _imageUrlText, size: 80.0),
            SizedBox(height: 20),
            TextField(
              controller: _imageUrlCtrl,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Hymn cover URL',
              ),
              onChanged: (value) {
                setState(() {
                  _imageUrlText = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("CANCEL"),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text("DONE"),
          onPressed: () => Navigator.pop(context, _imageUrlText),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _imageUrlCtrl.dispose();
  }
}
