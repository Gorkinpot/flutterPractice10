import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../stores/account_store.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final accountStore = GetIt.I<AccountStore>();

  @override
  Widget build(BuildContext context) {
    if (!accountStore.isLoggedIn) {
      return Scaffold(
        body: Center(child: Text('Вы не вошли')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${accountStore.userEmail}'),
            SizedBox(height: 8),
            Text('Имя: ${accountStore.userName ?? ""}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditProfileScreen()),
                );
              },
              child: Text('Редактировать профиль'),
            ),
            ElevatedButton(
              onPressed: () {
                accountStore.logout();
                Navigator.pop(context);
              },
              child: Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
