class CurrencyRate {
  String currencyCode;
  double rate; // relative to base (e.g., base = "USD")
  DateTime lastUpdated;

  CurrencyRate({
    required this.currencyCode,
    required this.rate,
    DateTime? lastUpdated,
  }) : lastUpdated = lastUpdated ?? DateTime.now();
}
