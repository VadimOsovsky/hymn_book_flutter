import 'package:hymnbook/data/hymns/hymns_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'hymns/hymns_table.dart';

part 'app_db.g.dart';

@UseMoor(tables: [Hymns], daos: [HymnsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 2;


  @override
  MigrationStrategy get migration {
    return MigrationStrategy (
      beforeOpen: (db, details) async {
        if (details.wasCreated) {

          await into(hymns).insert(Hymn(
            localId: null,
            title: "Awesome God",
            lyrics: _getHymn1Lyrics(),
            lyricsBy: "Rich Mullins",
            musicBy: "Rich Mullins",
            language: "en"
          ));

          await into(hymns).insert(Hymn(
              localId: null,
              title: "Our God is Greater",
              lyrics: _getHymn2Lyrics(),
              lyricsBy: "Chris Tomlin",
              musicBy: "Chris Tomlin",
              hymnCoverImage: "https://i.ytimg.com/vi/s592Pp5_8cY/hqdefault.jpg",
              language: "en"
          ));
        }
      },
    );
  }

  String _getHymn1Lyrics() {
    return "[Verse 1]\n" +
        "When He rolls up His sleeves\n" +
        "He ain't just putting on the ritz\n" +
        "(Our God is an awesome God)\n" +
        "There's thunder in His footsteps\n" +
        "And lightning in His fists\n" +
        "(Our God is an awesome God)\n" +
        "And the Lord wasn't joking\n" +
        "When He kicked 'em out of Eden\n" +
        "It wasn't for no reason\n" +
        "That He shed His blood\n" +
        "His return is very close\n" +
        "And so you better be believing that\n" +
        "Our God is an awesome God\n" +
        "\n" +
        "[Chorus]\n" +
        "Our God is an awesome God\n" +
        "He reigns from heaven above\n" +
        "With wisdom, power, and love\n" +
        "Our God is an awesome God\n" +
        "Our God is an awesome God\n" +
        "He reigns from heaven above\n" +
        "With wisdom, power, and love\n" +
        "Our God is an awesome God\n" +
        "\n" +
        "[Verse 2]\n" +
        "And when the sky was starless\n" +
        "In the void of the night\n" +
        "(Our God is an awesome God)\n" +
        "He spoke into the darkness\n" +
        "And created the light\n" +
        "(Our God is an awesome God)\n" +
        "Judgement and wrath\n" +
        "He poured out on Sodom\n" +
        "Mercy and grace\n" +
        "He gave us at the cross\n" +
        "I hope that we have not\n" +
        "Too quickly forgotten that\n" +
        "Our God is an awesome God\n" +
        "\n" +
        "[Chorus]\n" +
        "Our God is an awesome God\n" +
        "He reigns from heaven above\n" +
        "With wisdom, power, and love\n" +
        "Our God is an awesome God\n" +
        "Our God is an awesome God\n" +
        "He reigns from heaven above\n" +
        "With wisdom, power, and love\n" +
        "Our God is an awesome God\n" +
        "\n" +
        "[Outro]\n" +
        "Our God is an awesome God (Our God is an awesome God)\n" +
        "He reigns from heaven above (He reigns from heaven above)\n" +
        "With wisdom, power, and love (With wisdom, power, and love)\n" +
        "Our God is an awesome God\n" +
        "Our God is an awesome God\n" +
        "Our God is an awesome God";
  }

  String _getHymn2Lyrics() {
    return "Water You turned into wine, opened the eyes of the blind\n" +
        "there's no one like You, none like You!\n" +
        "Into the darkness You shine, out of the ashes we rise\n" +
        "there's no one like You, none like You!\n" +
        "\n" +
        "Our God is greater, our God is stronger\n" +
        "God, You are higher than any other\n" +
        "Our God is Healer, awesome in power\n" +
        "Our God! Our God!\n" +
        "\n" +
        "Into the darkness You shine, out of the ashes we rise\n" +
        "there's no one like You, none like You!\n" +
        "\n" +
        "Our God is greater, our God is stronger\n" +
        "God, You are higher than any other\n" +
        "Our God is Healer, awesome in power\n" +
        "Our God! Our God!\n" +
        "Our God is greater, our God is stronger\n" +
        "God, You are higher than any other\n" +
        "Our God is Healer, awesome in power\n" +
        "Our God! Our God!\n" +
        "\n" +
        "And if our God is for us, then who could ever stop us?\n" +
        "And if our God is with us, then what could stand against?\n" +
        "And if our God is for us, then who could ever stop us?\n" +
        "And if our God is with us, then what could stand against?\n" +
        "Then what could stand against?\n" +
        "\n" +
        "Our God is greater, our God is stronger\n" +
        "God, You are higher than any other\n" +
        "Our God is Healer, awesome in power\n" +
        "Our God! Our God!\n" +
        "Our God is greater, our God is stronger\n" +
        "God, You are higher than any other\n" +
        "Our God is Healer, awesome in power\n" +
        "Our God! Our God!\n" +
        "\n" +
        "And if our God is for us, then who could ever stop us?\n" +
        "And if our God is with us, then what could stand against?\n" +
        "And if our God is for us, then who could ever stop us?\n" +
        "And if our God is with us, then what could stand against?\n" +
        "Then what could stand against?\n" +
        "\n" +
        "Our God is greater, our God is stronger\n" +
        "God, You are higher than any other\n" +
        "Our God is Healer, awesome in power\n" +
        "Our God! Our God!\n" +
        "Our God is greater, our God is stronger\n" +
        "God, You are higher than any other\n" +
        "Our God is Healer, awesome in power\n" +
        "Our God! Our God!";
  }
}
