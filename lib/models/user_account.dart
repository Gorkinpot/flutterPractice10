class UserAccount {
  String id;
  String name;
  String email;
  String password;
  List<String> favoriteCurrencies;

  UserAccount({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.favoriteCurrencies = const [],
  });
}
