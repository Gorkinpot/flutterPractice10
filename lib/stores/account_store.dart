import 'package:mobx/mobx.dart';
part 'account_store.g.dart';

class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  @observable
  String? userEmail;

  @observable
  String? userName;

  @observable
  String? country;

  @observable
  DateTime? birthDate;

  @observable
  DateTime? registrationDate;

  @observable
  bool isLoggedIn = false;

  final Map<String, Map<String, dynamic>> _users = {};
  // email -> {password, name, country, birthDate, registrationDate}

  @action
  String? register(String email, String password) {
    if (_users.containsKey(email)) return 'Пользователь уже существует';

    _users[email] = {
      'password': password,
      'name': '',
      'country': '',
      'birthDate': null,
      'registrationDate': DateTime.now(),
    };
    return null;
  }

  @action
  String? login(String email, String password) {
    if (!_users.containsKey(email)) return 'Пользователь не найден';
    if (_users[email]!['password'] != password) return 'Неверный пароль';

    final data = _users[email]!;
    userEmail = email;
    userName = data['name'];
    country = data['country'];
    birthDate = data['birthDate'];
    registrationDate = data['registrationDate'];
    isLoggedIn = true;

    return null;
  }

  @action
  void updateProfile({
    String? name,
    String? countryValue,
    DateTime? birth,
  }) {
    if (userEmail == null) return;

    final data = _users[userEmail!]!;
    if (name != null) {
      data['name'] = name;
      userName = name;
    }
    if (countryValue != null) {
      data['country'] = countryValue;
      country = countryValue;
    }
    if (birth != null) {
      data['birthDate'] = birth;
      birthDate = birth;
    }
  }

  @action
  void logout() {
    userEmail = null;
    userName = null;
    country = null;
    birthDate = null;
    registrationDate = null;
    isLoggedIn = false;
  }
}
