import 'package:get_it/get_it.dart';
import 'services/account_service.dart';
import 'services/conversion_service.dart';
import 'services/exchange_rate_service.dart';
import 'services/alert_service.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<AccountService>(AccountService());
  getIt.registerSingleton<ConversionService>(ConversionService());
  getIt.registerSingleton<ExchangeRateService>(ExchangeRateService());
  getIt.registerSingleton<AlertService>(AlertService());
}
