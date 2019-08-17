import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';

class HymnViewAndroid extends StatelessWidget {
  final Hymn hymn;

  const HymnViewAndroid({Key key, @required this.hymn}) : super(key: key);

  String _getAuthorName() {
    if (hymn.lyricsBy != null && hymn.lyricsBy != "")
      return hymn.lyricsBy;
    else if (hymn.musicBy != null && hymn.musicBy != "")
      return hymn.musicBy;
    else
      return "Unknown author";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(hymn.title),
            SizedBox(height: 2.0),
            Text(_getAuthorName(),
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Text(hymn.lyrics, style: Theme.of(context).textTheme.subhead),
          SizedBox(height: 80.0)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        tooltip: "Start/stop scrolling",
        onPressed: () {},
      ),
    );
  }
}
