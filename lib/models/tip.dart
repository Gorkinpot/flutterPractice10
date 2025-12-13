class Tip {
  final String text;
  final DateTime createdAt;
  bool favorite;

  Tip({
    required this.text,
    DateTime? createdAt,
    this.favorite = false,
  }) : createdAt = createdAt ?? DateTime.now();
}
