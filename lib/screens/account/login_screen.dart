import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../stores/account_store.dart';
import 'package:project/screens/account/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final accountStore = GetIt.I<AccountStore>();

  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Вход')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(error!, style: TextStyle(color: Colors.red)),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final e = emailController.text.trim();
                final p = passwordController.text.trim();
                final result = accountStore.login(e, p);
                if (result != null) {
                  setState(() {
                    error = result;
                  });
                } else {
                  Navigator.pop(context); // Возврат на главный экран после входа
                }
              },
              child: Text('Войти'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterScreen()),
                );
              },
              child: Text('Нет аккаунта? Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
