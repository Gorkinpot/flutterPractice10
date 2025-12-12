class AccountService {
  String? currentUser;
  List<String> users = [];

  bool login(String email) {
    if (users.contains(email)) {
      currentUser = email;
      return true;
    }
    return false;
  }

  void register(String email) {
    if (!users.contains(email)) users.add(email);
    currentUser = email;
  }

  void logout() {
    currentUser = null;
  }
}
