import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../stores/account_store.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final accountStore = GetIt.I<AccountStore>();
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: accountStore.userName ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Редактировать профиль')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                accountStore.updateProfile(name: nameController.text.trim());
                Navigator.pop(context); // Возврат на экран профиля
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
