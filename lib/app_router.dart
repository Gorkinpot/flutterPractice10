import 'package:go_router/go_router.dart';
import 'package:project/screens/converter/currency_converter_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => CurrencyConverterScreen()),
  ],
);
