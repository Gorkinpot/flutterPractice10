import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../stores/account_store.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final accountStore = GetIt.I<AccountStore>();

  late TextEditingController nameController;
  late TextEditingController countryController;
  DateTime? birthDate;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: accountStore.userName ?? '');
    countryController = TextEditingController(text: accountStore.country ?? '');
    birthDate = accountStore.birthDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(title: const Text('Редактировать профиль')),
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
                _field(nameController, 'Имя', Icons.person),
                const SizedBox(height: 16),
                _field(countryController, 'Страна', Icons.public),
                const SizedBox(height: 16),

                ListTile(
                  leading: const Icon(Icons.cake),
                  title: const Text('Дата рождения'),
                  subtitle: Text(
                    birthDate != null
                        ? _fmt(birthDate!)
                        : 'Не указана',
                  ),
                  onTap: _pickDate,
                ),

                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _save,
                    child: const Text('Сохранить'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String label, IconData icon) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }

  void _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: birthDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() => birthDate = date);
    }
  }

  void _save() {
    accountStore.updateProfile(
      name: nameController.text.trim(),
      countryValue: countryController.text.trim(),
      birth: birthDate,
    );
    Navigator.pop(context);
  }

  String _fmt(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';
}
