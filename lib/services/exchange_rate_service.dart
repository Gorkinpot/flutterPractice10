class ExchangeRateService {
  final Map<String, double> rates = {
    'USD': 1.0,
    'EUR': 0.9,
    'GBP': 0.8,
    'JPY': 140.0,
  };

  double getRate(String currency) => rates[currency] ?? 1.0;
}
