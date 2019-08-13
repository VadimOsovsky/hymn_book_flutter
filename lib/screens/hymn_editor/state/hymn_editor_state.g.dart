// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hymn_editor_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$HymnEditorState on _HymnEditorState, Store {
  final _$hymnCoverImageAtom = Atom(name: '_HymnEditorState.hymnCoverImage');

  @override
  String get hymnCoverImage {
    _$hymnCoverImageAtom.context.enforceReadPolicy(_$hymnCoverImageAtom);
    _$hymnCoverImageAtom.reportObserved();
    return super.hymnCoverImage;
  }

  @override
  set hymnCoverImage(String value) {
    _$hymnCoverImageAtom.context.conditionallyRunInAction(() {
      super.hymnCoverImage = value;
      _$hymnCoverImageAtom.reportChanged();
    }, _$hymnCoverImageAtom, name: '${_$hymnCoverImageAtom.name}_set');
  }
}
