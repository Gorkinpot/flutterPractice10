class Conversion {
  String fromCurrency;
  String toCurrency;
  double amount;
  double result;
  DateTime timestamp;

  Conversion({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
    required this.result,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
