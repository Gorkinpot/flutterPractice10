import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/stores/account_store.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final accountStore = GetIt.I<AccountStore>();

  @override
  Widget build(BuildContext context) {
    if (!accountStore.isLoggedIn) {
      return const Scaffold(
        body: Center(child: Text('Вы не вошли')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'logout') {
                _confirmLogout(context);
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'logout',
                child: Text('Выйти'),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF0F4F8),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),
                const SizedBox(height: 16),
                Text(
                  accountStore.userName?.isNotEmpty == true
                      ? accountStore.userName!
                      : 'Без имени',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(accountStore.userEmail ?? ''),

                const Divider(height: 32),

                _infoRow('Страна', accountStore.country ?? '—'),
                _infoRow(
                  'Дата рождения',
                  accountStore.birthDate != null
                      ? _fmt(accountStore.birthDate!)
                      : '—',
                ),
                _infoRow(
                  'Регистрация',
                  accountStore.registrationDate != null
                      ? _fmt(accountStore.registrationDate!)
                      : '—',
                ),

                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => EditProfileScreen()),
                      );
                    },
                    child: const Text('Редактировать профиль'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value),
        ],
      ),
    );
  }

  String _fmt(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Выход'),
        content: const Text('Вы действительно хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              accountStore.logout();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }
}
