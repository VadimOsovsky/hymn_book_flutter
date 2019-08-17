// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$HomeState on _HomeState, Store {
  final _$selectedHymnIdsAtom = Atom(name: '_HomeState.selectedHymnIds');

  @override
  Set<int> get selectedHymnIds {
    _$selectedHymnIdsAtom.context.enforceReadPolicy(_$selectedHymnIdsAtom);
    _$selectedHymnIdsAtom.reportObserved();
    return super.selectedHymnIds;
  }

  @override
  set selectedHymnIds(Set<int> value) {
    _$selectedHymnIdsAtom.context.conditionallyRunInAction(() {
      super.selectedHymnIds = value;
      _$selectedHymnIdsAtom.reportChanged();
    }, _$selectedHymnIdsAtom, name: '${_$selectedHymnIdsAtom.name}_set');
  }
}
