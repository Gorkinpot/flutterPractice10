class CurrencyRate {
  String currencyCode;
  double rate;
  DateTime lastUpdated;

  CurrencyRate({
    required this.currencyCode,
    required this.rate,
    DateTime? lastUpdated,
  }) : lastUpdated = lastUpdated ?? DateTime.now();
}
