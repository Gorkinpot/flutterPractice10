import 'package:mobx/mobx.dart';

part 'exchange_rate_store.g.dart';

class ExchangeRateStore = _ExchangeRateStore with _$ExchangeRateStore;

abstract class _ExchangeRateStore with Store {
  @observable
  ObservableMap<String, double> rates = ObservableMap.of({
    'USD': 1.0,
    'EUR': 0.9,
    'GBP': 0.8,
    'JPY': 140.0,
  });

  @observable
  ObservableList<String> favorites = ObservableList<String>();

  @action
  double getRate(String currency) => rates[currency] ?? 1.0;

  @action
  void toggleFavorite(String currency) {
    if(favorites.contains(currency)) {
      favorites.remove(currency);
    } else {
      favorites.add(currency);
    }
  }
}
