import 'package:project/models/user_account.dart';

class AccountService {
  List<UserAccount> users = [];
  UserAccount? currentUser;

  void register(UserAccount user) {
    users.add(user);
    currentUser = user;
  }

  bool login(String email, String password) {
    final user = users.firstWhere(
          (u) => u.email == email && u.password == password,
      orElse: () => UserAccount(id: '', name: '', email: '', password: ''),
    );
    if (user.id.isNotEmpty) {
      currentUser = user;
      return true;
    }
    return false;
  }

  void logout() => currentUser = null;

  void updateProfile(String name, String email) {
    if (currentUser != null) {
      currentUser!.name = name;
      currentUser!.email = email;
    }
  }
}
