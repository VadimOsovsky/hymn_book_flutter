import 'package:moor_flutter/moor_flutter.dart';

class Hymns extends Table {
  IntColumn get localId => integer().autoIncrement()();

  TextColumn get id => text().withLength(min: 24, max: 24).nullable()();

  TextColumn get title => text().withLength(min: 1, max: 100)();

  // TODO enhance lyrics
  TextColumn get lyrics => text().withLength(min: 1, max: 4000)();

  TextColumn get musicBy => text().withLength(min: 1, max: 100).nullable()();

  TextColumn get lyricsBy => text().withLength(min: 1, max: 100).nullable()();

  TextColumn get hymnCoverImage => text().nullable()();

  TextColumn get language => text().withLength(min: 1, max: 100)();

  TextColumn get submittedBy =>
      text().withLength(min: 24, max: 24).nullable()();


  // util methods
  static String formatLyricsForPreview(String lyrics) {
    return lyrics.replaceAll(RegExp("(?:\r\n|\r|\n|\s\s+)"), " ");
  }
}
