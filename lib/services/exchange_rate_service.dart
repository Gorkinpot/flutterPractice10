import 'package:project/models/currency_rate.dart';

class ExchangeRateService {
  List<CurrencyRate> rates = [];

  void updateRates(List<CurrencyRate> newRates) {
    rates = newRates;
  }
}
