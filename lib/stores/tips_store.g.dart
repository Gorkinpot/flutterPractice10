// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TipsStore on _TipsStore, Store {
  late final _$tipsAtom = Atom(name: '_TipsStore.tips', context: context);

  @override
  ObservableList<Tip> get tips {
    _$tipsAtom.reportRead();
    return super.tips;
  }

  @override
  set tips(ObservableList<Tip> value) {
    _$tipsAtom.reportWrite(value, super.tips, () {
      super.tips = value;
    });
  }

  late final _$_TipsStoreActionController = ActionController(
    name: '_TipsStore',
    context: context,
  );

  @override
  void addTip(String text) {
    final _$actionInfo = _$_TipsStoreActionController.startAction(
      name: '_TipsStore.addTip',
    );
    try {
      return super.addTip(text);
    } finally {
      _$_TipsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTip(int index) {
    final _$actionInfo = _$_TipsStoreActionController.startAction(
      name: '_TipsStore.removeTip',
    );
    try {
      return super.removeTip(index);
    } finally {
      _$_TipsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorite(int index) {
    final _$actionInfo = _$_TipsStoreActionController.startAction(
      name: '_TipsStore.toggleFavorite',
    );
    try {
      return super.toggleFavorite(index);
    } finally {
      _$_TipsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tips: ${tips}
    ''';
  }
}
