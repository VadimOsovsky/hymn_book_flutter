import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/screens/home/state/home_state.dart';

class HymnBottomSheet extends StatelessWidget {
  final Hymn hymn;
  final HomeState homeState;

  const HymnBottomSheet(
      {Key key, @required this.hymn, @required this.homeState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(hymn.title, style: Theme.of(context).textTheme.title),
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.delete_outline),
          title: Text('Delete'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.check_circle),
          title: Text('Select'),
          onTap: () {
            Navigator.of(context).pop();
            homeState.onSelectHymn(hymn.localId);
          },
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: () {},
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
