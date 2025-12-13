import 'dart:async';
import 'dart:math';
import 'package:mobx/mobx.dart';

part 'exchange_rate_store.g.dart';

class ExchangeRateStore = _ExchangeRateStore with _$ExchangeRateStore;

abstract class _ExchangeRateStore with Store {
  final Random _random = Random();
  Timer? _timer;

  @observable
  ObservableMap<String, double> rates = ObservableMap.of({
    'USD': 1.0,
    'EUR': 0.92,
    'GBP': 0.82,
    'JPY': 140.0,
    'RUB': 75.0,
  });

  @observable
  ObservableList<String> favorites = ObservableList<String>();

  _ExchangeRateStore() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateRates());
  }

  @action
  void _updateRates() {
    rates.forEach((key, value) {
      // меняем курс на ±0.5%
      final change = (1 + (_random.nextDouble() - 0.5) / 100);
      rates[key] = double.parse((value * change).toStringAsFixed(4));
    });
  }

  @action
  double getRate(String currency) => rates[currency] ?? 1.0;

  @action
  void toggleFavorite(String currency) {
    if (favorites.contains(currency)) {
      favorites.remove(currency);
    } else {
      favorites.add(currency);
    }
  }

  @action
  void dispose() {
    _timer?.cancel();
  }
}
