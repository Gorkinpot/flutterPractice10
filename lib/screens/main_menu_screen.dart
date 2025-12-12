import 'package:flutter/material.dart';
import 'package:project/screens/converter/currency_converter_screen.dart';
import 'package:project/screens/rates/exchange_rates_screen.dart';
import 'package:project/screens/history/conversion_history_screen.dart';
import 'package:project/screens/favorites/favorite_currencies_screen.dart';
import 'package:project/screens/alerts/rate_alerts_screen.dart';
import 'package:project/screens/tips/tips_screen.dart';
import 'account/login_screen.dart';
import 'account/profile_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Конвертер валют'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen()),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CurrencyConverterScreen())),
                child: const Text("Конвертер валют")
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ExchangeRatesScreen())),
              child: const Text('Курсы валют'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ConversionHistoryScreen())),
              child: const Text('История конверсий'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FavoriteCurrenciesScreen())),
              child: const Text('Избранные валюты'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RateAlertsScreen())),
              child: const Text('Уведомления о курсах'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TipsScreen())),
              child: const Text('Советы и статьи'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen())),
              child: const Text('Войти / Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
