import 'package:flutter/material.dart';
import 'converter/currency_converter_screen.dart';
import 'rates/exchange_rates_screen.dart';
import 'history/conversion_history_screen.dart';
import 'favorites/favorite_currencies_screen.dart';
import 'alerts/rate_alerts_screen.dart';
import 'tips/tips_screen.dart';
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _row(
                context,
                _MenuCard(
                  icon: Icons.currency_exchange,
                  title: 'Конвертер',
                  onTap: () => _open(context, CurrencyConverterScreen()),
                ),
                _MenuCard(
                  icon: Icons.trending_up,
                  title: 'Курсы валют',
                  onTap: () => _open(context, ExchangeRatesScreen()),
                ),
              ),
              const SizedBox(height: 12),
              _row(
                context,
                _MenuCard(
                  icon: Icons.history,
                  title: 'История',
                  onTap: () => _open(context, ConversionHistoryScreen()),
                ),
                _MenuCard(
                  icon: Icons.star,
                  title: 'Избранное',
                  onTap: () => _open(context, FavoriteCurrenciesScreen()),
                ),
              ),
              const SizedBox(height: 12),
              _row(
                context,
                _MenuCard(
                  icon: Icons.notifications,
                  title: 'Уведомления',
                  onTap: () => _open(context, RateAlertsScreen()),
                ),
                _MenuCard(
                  icon: Icons.lightbulb_outline,
                  title: 'Советы',
                  onTap: () => _open(context, TipsScreen()),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _MenuCard(
                  icon: Icons.login,
                  title: 'Вход / Профиль',
                  onTap: () => _open(context, LoginScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(BuildContext context, Widget left, Widget right) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: left),
          const SizedBox(width: 12),
          Expanded(child: right),
        ],
      ),
    );
  }

  void _open(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
