import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/data/hymns/hymns_table.dart';
import 'package:hymnbook/screens/home/state/home_state.dart';
import 'package:provider/provider.dart';

import 'hymn_cover_image.dart';

class HymnItem extends StatelessWidget {
  final Hymn hymn;

  const HymnItem({Key key, this.hymn}) : super(key: key);

  Widget _buildDeleteHymnDialog(BuildContext context) {
    return AlertDialog(
      title: Text(hymn.title),
      content: Text("Would you like to delete this hymn from saved?"),
      actions: <Widget>[
        FlatButton(
          child: Text("CANCEL"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        FlatButton(
          child: Text("DELETE"),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _homeState = Provider.of<HomeState>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Dismissible(
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20.0),
          color: Colors.redAccent,
          child: Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: 32.0,
          ),
        ),
        key: Key(hymn.localId.toString()),
        confirmDismiss: (dir) async => await showDialog(
          context: context,
          builder: _buildDeleteHymnDialog,
        ),
        onDismissed: (dir) {
          _homeState.onDeleteFromSavedHymns(hymn.localId);
        },
        direction: DismissDirection.endToStart,
        child: ListTile(
          leading: HymnCoverImage(imageUrl: hymn.hymnCoverImage),
          title: Text(
            hymn.title ?? "Unknown title",
            style: TextStyle(fontSize: 18.0),
          ),
          subtitle: Text(
            Hymns.formatLyricsForPreview(hymn.lyrics) ??
                "No lyrics for this hymn...",
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
