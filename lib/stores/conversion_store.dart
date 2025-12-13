import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'exchange_rate_store.dart';

class ConversionStore extends ChangeNotifier {
  final ExchangeRateStore rateStore = GetIt.I<ExchangeRateStore>();

  double? result;
  final List<String> _history = [];

  List<String> get history => List.unmodifiable(_history);

  void convert(String fromCurrency, String toCurrency, double amount) {
    final fromRate = rateStore.getRate(fromCurrency);
    final toRate = rateStore.getRate(toCurrency);

    result = amount * (toRate / fromRate);

    _history.insert(
      0,
      '${amount.toStringAsFixed(2)} $fromCurrency → '
          '${result!.toStringAsFixed(2)} $toCurrency',
    );

    notifyListeners();
  }

  void removeAt(int index) {
    _history.removeAt(index);
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }
}
