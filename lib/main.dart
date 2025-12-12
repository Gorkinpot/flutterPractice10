import 'package:flutter/material.dart';
import 'di.dart';
import 'app_router.dart';

void main() {
  setupDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Конвертер валют',
      routerConfig: router,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
