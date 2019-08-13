import 'package:flutter/widgets.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/data/hymns/hymns_dao.dart';

class HomeState with ChangeNotifier {
  deleteFromSavedHymns(HymnsDao hymnsDao, int localId) async {
    await hymnsDao.deleteFromSavedHymns(localId);
    notifyListeners();
  }

  testCreateHymn(HymnsDao hymnsDao) async {
    final hymn = Hymn(
      localId: null,
      title: "Awesome God",
      lyrics: "[Verse 1]\n" +
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
          "Our God is an awesome God",
      musicBy: "Rich Mullins",
      lyricsBy: "Rich Mullins",
      language: "en",
    );

    await hymnsDao.addToSavedHymns(hymn);
    notifyListeners();
  }
}
