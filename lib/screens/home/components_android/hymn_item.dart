import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/data/hymns/hymns_table.dart';
import 'package:hymnbook/screens/home/state/home_state.dart';
import 'package:hymnbook/screens/hymn_view/hymn_view_route.dart';
import 'package:provider/provider.dart';

import 'hymn_bottom_sheet.dart';
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
    final homeState = Provider.of<HomeState>(context);
    final selectorSize = 25.0;

    return Observer(
      builder: (_) => Container(
        color: homeState.selectedHymnIds.contains(hymn.localId)
            ? Theme.of(context).selectedRowColor
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
              homeState.onDeleteFromSavedHymns(hymn.localId);
            },
            direction: DismissDirection.endToStart,
            child: ListTile(
              leading: Stack(children: [
                HymnCoverImage(imageUrl: hymn.hymnCoverImage),
                Positioned(
                  bottom: -2.0,
                  right: -2.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      color: Theme.of(context).selectedRowColor,
                      width: homeState.selectedHymnIds.contains(hymn.localId)
                          ? selectorSize
                          : 0.0,
                      height: homeState.selectedHymnIds.contains(hymn.localId)
                          ? selectorSize
                          : 0.0,
                      child: Icon(Icons.check_circle,
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                ),
              ]),
              title: Text(
                hymn.title ?? "Unknown title",
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                Hymns.formatLyricsForPreview(hymn.lyrics) ??
                    "No lyrics for this hymn...",
                maxLines: 2,
              ),
              onTap: homeState.selectedHymnIds.length > 0
                  ? () => homeState.onSelectHymn(hymn.localId)
                  : () => Navigator.pushNamed(
                        context,
                        HymnViewRoute.name,
                        arguments: HymnViewScreenArgs(hymn: hymn),
                      ),
              onLongPress: () => showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  builder: (_) => HymnBottomSheet(
                        hymn: hymn,
                        homeState: homeState,
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
