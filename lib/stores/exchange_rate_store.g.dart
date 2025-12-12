// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExchangeRateStore on _ExchangeRateStore, Store {
  late final _$ratesAtom = Atom(
    name: '_ExchangeRateStore.rates',
    context: context,
  );

  @override
  ObservableMap<String, double> get rates {
    _$ratesAtom.reportRead();
    return super.rates;
  }

  @override
  set rates(ObservableMap<String, double> value) {
    _$ratesAtom.reportWrite(value, super.rates, () {
      super.rates = value;
    });
  }

  late final _$favoritesAtom = Atom(
    name: '_ExchangeRateStore.favorites',
    context: context,
  );

  @override
  ObservableList<String> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<String> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$_ExchangeRateStoreActionController = ActionController(
    name: '_ExchangeRateStore',
    context: context,
  );

  @override
  double getRate(String currency) {
    final _$actionInfo = _$_ExchangeRateStoreActionController.startAction(
      name: '_ExchangeRateStore.getRate',
    );
    try {
      return super.getRate(currency);
    } finally {
      _$_ExchangeRateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorite(String currency) {
    final _$actionInfo = _$_ExchangeRateStoreActionController.startAction(
      name: '_ExchangeRateStore.toggleFavorite',
    );
    try {
      return super.toggleFavorite(currency);
    } finally {
      _$_ExchangeRateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rates: ${rates},
favorites: ${favorites}
    ''';
  }
}
