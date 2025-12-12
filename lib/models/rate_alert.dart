class RateAlert {
  String currencyCode;
  double targetRate;
  bool isActive;

  RateAlert({
    required this.currencyCode,
    required this.targetRate,
    this.isActive = true,
  });
}
