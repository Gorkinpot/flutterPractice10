// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlertStore on _AlertStore, Store {
  late final _$alertsAtom = Atom(name: '_AlertStore.alerts', context: context);

  @override
  ObservableList<String> get alerts {
    _$alertsAtom.reportRead();
    return super.alerts;
  }

  @override
  set alerts(ObservableList<String> value) {
    _$alertsAtom.reportWrite(value, super.alerts, () {
      super.alerts = value;
    });
  }

  late final _$_AlertStoreActionController = ActionController(
    name: '_AlertStore',
    context: context,
  );

  @override
  void addAlert(String text) {
    final _$actionInfo = _$_AlertStoreActionController.startAction(
      name: '_AlertStore.addAlert',
    );
    try {
      return super.addAlert(text);
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alerts: ${alerts}
    ''';
  }
}
