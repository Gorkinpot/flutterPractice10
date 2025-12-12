class RateAlert {
  String id;
  String currencyCode;
  double targetRate;
  bool isActive;

  RateAlert({
    required this.id,
    required this.currencyCode,
    required this.targetRate,
    this.isActive = true,
  });
}
