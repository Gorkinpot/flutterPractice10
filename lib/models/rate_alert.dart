class RateAlert {
  final String from;
  final String to;
  final double value;
  final bool isGreater;
  bool enabled;
  final DateTime createdAt;

  RateAlert({
    required this.from,
    required this.to,
    required this.value,
    required this.isGreater,
    this.enabled = true,
    required this.createdAt,
  });
}
