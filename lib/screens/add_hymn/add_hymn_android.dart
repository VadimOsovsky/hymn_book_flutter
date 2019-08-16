import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hymnbook/data/app_db.dart';
import 'package:hymnbook/screens/hymn_editor/hymn_editor_route.dart';

class AddHymnAndroid extends StatelessWidget {
  _navigateToHymnEditor(BuildContext context, String hymnTitle) {
    final hymn = new Hymn(
      localId: null,
      title: hymnTitle,
      language: null,
      lyrics: "",
    );
    Navigator.pushNamed(
      context,
      HymnEditorRoute.name,
      arguments: HymnEditorScreenArguments(hymn: hymn),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleCtrl = TextEditingController();
    final titleSize = 30.0;

    List<Widget> _buildBody(BuildContext context) {
      return [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
              icon: Icon(Icons.close),
              tooltip: "Close",
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.pop(context);
              }),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: TextField(
                controller: titleCtrl,
                textCapitalization: TextCapitalization.sentences,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Hymn title...",
                  focusColor: Colors.black,
                  hintStyle:
                      TextStyle(fontSize: titleSize, color: Colors.black26),
                ),
                style: TextStyle(fontSize: titleSize),
              ),
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text: "Didn't find what you were looking for? ",
            style: Theme.of(context).textTheme.body1,
            children: <TextSpan>[
              TextSpan(
                  text: 'Add new',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => _navigateToHymnEditor(context, titleCtrl.text)),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        )
      ];
    }

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: _buildBody(context),
          ),
        ),
      ),
    );
  }
}
