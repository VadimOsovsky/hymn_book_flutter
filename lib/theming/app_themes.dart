import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final _materialPrimaryColor = Colors.teal;

  static get material => ThemeData(
        primarySwatch: _materialPrimaryColor,
        primaryColorDark: Colors.teal[800],
        primaryColorLight: Colors.tealAccent[700],
        errorColor: Colors.red,
        selectedRowColor: Color(0xFFEEEEEE),
//        textTheme: TextTheme(
//          button: TextStyle(
//            fontSize: 16.0,
//          ),
//        ),
        buttonTheme: ButtonThemeData(
          buttonColor: _materialPrimaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hasFloatingPlaceholder: true,
          hintStyle: TextStyle(
            fontSize: 18.0,
          ),
          labelStyle: TextStyle(
            fontSize: 18.0,
          ),
          isDense: true
        ),
      );

  static get cupertino => CupertinoThemeData(
        primaryColor: CupertinoColors.activeOrange,
      );
}
