import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'stores/account_store.dart';
import 'stores/conversion_store.dart';
import 'stores/exchange_rate_store.dart';
import 'stores/alert_store.dart';
import 'stores/tips_store.dart';
import 'screens/main_menu_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final gi = GetIt.I;
  gi.registerSingleton<ExchangeRateStore>(ExchangeRateStore());
  gi.registerSingleton<AccountStore>(AccountStore());
  gi.registerSingleton<ConversionStore>(ConversionStore());
  gi.registerSingleton<AlertStore>(AlertStore());
  gi.registerSingleton<TipsStore>(TipsStore());

  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Конвертер валют',
      theme: ThemeData(
        primaryColor: const Color(0xFF8EC5FC), // мягкий голубой
        scaffoldBackgroundColor: const Color(0xFFF0F4F8), // светло-серый фон
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8EC5FC),
          foregroundColor: Colors.black,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6CA0DC), // мягкий синий
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const MainMenuScreen(),
    );
  }
}
