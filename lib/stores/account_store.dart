import 'package:mobx/mobx.dart';
part 'account_store.g.dart';

class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  @observable
  String? userEmail;

  @observable
  String? userName;

  @observable
  bool isLoggedIn = false;

  final Map<String, Map<String, String>> _users = {}; // email -> {password, name}

  @action
  String? register(String email, String password, {String? name}) {
    if (_users.containsKey(email)) return 'Пользователь уже существует';
    _users[email] = {'password': password, 'name': name ?? ''};
    return null;
  }

  @action
  String? login(String email, String password) {
    if (!_users.containsKey(email)) return 'Пользователь не найден';
    if (_users[email]!['password'] != password) return 'Неверный пароль';
    userEmail = email;
    userName = _users[email]!['name'];
    isLoggedIn = true;
    return null;
  }

  @action
  void logout() {
    userEmail = null;
    userName = null;
    isLoggedIn = false;
  }

  @action
  void updateProfile({String? name}) {
    if (userEmail == null) return;
    if (name != null) {
      _users[userEmail!]!['name'] = name;
      userName = name;
    }
  }
}
