// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConverterStore on _ConverterStore, Store {
  late final _$fromCurrencyAtom = Atom(
    name: '_ConverterStore.fromCurrency',
    context: context,
  );

  @override
  String get fromCurrency {
    _$fromCurrencyAtom.reportRead();
    return super.fromCurrency;
  }

  @override
  set fromCurrency(String value) {
    _$fromCurrencyAtom.reportWrite(value, super.fromCurrency, () {
      super.fromCurrency = value;
    });
  }

  late final _$toCurrencyAtom = Atom(
    name: '_ConverterStore.toCurrency',
    context: context,
  );

  @override
  String get toCurrency {
    _$toCurrencyAtom.reportRead();
    return super.toCurrency;
  }

  @override
  set toCurrency(String value) {
    _$toCurrencyAtom.reportWrite(value, super.toCurrency, () {
      super.toCurrency = value;
    });
  }

  late final _$amountAtom = Atom(
    name: '_ConverterStore.amount',
    context: context,
  );

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$resultAtom = Atom(
    name: '_ConverterStore.result',
    context: context,
  );

  @override
  double get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(double value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$_ConverterStoreActionController = ActionController(
    name: '_ConverterStore',
    context: context,
  );

  @override
  void setFromCurrency(String? value) {
    final _$actionInfo = _$_ConverterStoreActionController.startAction(
      name: '_ConverterStore.setFromCurrency',
    );
    try {
      return super.setFromCurrency(value);
    } finally {
      _$_ConverterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToCurrency(String? value) {
    final _$actionInfo = _$_ConverterStoreActionController.startAction(
      name: '_ConverterStore.setToCurrency',
    );
    try {
      return super.setToCurrency(value);
    } finally {
      _$_ConverterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmount(double value) {
    final _$actionInfo = _$_ConverterStoreActionController.startAction(
      name: '_ConverterStore.setAmount',
    );
    try {
      return super.setAmount(value);
    } finally {
      _$_ConverterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void convert() {
    final _$actionInfo = _$_ConverterStoreActionController.startAction(
      name: '_ConverterStore.convert',
    );
    try {
      return super.convert();
    } finally {
      _$_ConverterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fromCurrency: ${fromCurrency},
toCurrency: ${toCurrency},
amount: ${amount},
result: ${result}
    ''';
  }
}
