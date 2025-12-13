import 'package:flutter/foundation.dart';

class ConversionStore extends ChangeNotifier {
  final Map<String, double> fakeRates = {
    'USD': 1.0,
    'EUR': 0.92,
    'RUB': 75.0,
    'GBP': 0.82,
    'JPY': 140.0,
  };

  double? result;
  final List<String> _history = [];

  List<String> get history => List.unmodifiable(_history);

  void convert(String fromCurrency, String toCurrency, double amount) {
    final fromRate = fakeRates[fromCurrency]!;
    final toRate = fakeRates[toCurrency]!;

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
