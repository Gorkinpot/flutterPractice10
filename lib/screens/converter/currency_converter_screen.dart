import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/conversion_store.dart';
import '../../stores/exchange_rate_store.dart';
import '../history/conversion_history_screen.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController amountController = TextEditingController();
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';

  final ConversionStore store = GetIt.I<ConversionStore>();
  final ExchangeRateStore rateStore = GetIt.I<ExchangeRateStore>();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // подписываемся на обновление курсов и пересчет результата
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (amountController.text.isNotEmpty) {
        final amount = double.tryParse(amountController.text);
        if (amount != null) {
          store.result = amount *
              (rateStore.getRate(toCurrency) / rateStore.getRate(fromCurrency));
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void convert() {
    final double? amount = double.tryParse(amountController.text);
    if (amount == null) return;
    store.convert(fromCurrency, toCurrency, amount);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Конвертер валют'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ConversionHistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Карточка ввода суммы и выбора валют
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 5,
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Введите сумму для конверсии',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Сумма',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.attach_money),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: fromCurrency,
                              decoration: const InputDecoration(
                                labelText: 'Из',
                                border: OutlineInputBorder(),
                              ),
                              items: rateStore.rates.keys
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() => fromCurrency = val!);
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.arrow_forward, size: 32),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: toCurrency,
                              decoration: const InputDecoration(
                                labelText: 'В',
                                border: OutlineInputBorder(),
                              ),
                              items: rateStore.rates.keys
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() => toCurrency = val!);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: convert,
                          icon: const Icon(Icons.swap_horiz),
                          label: const Text('Конвертировать'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Результат конверсии
              if (store.result != null)
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  color: Colors.green[50],
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Результат конверсии',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: Text(
                            '${store.result!.toStringAsFixed(2)} $toCurrency',
                            key: ValueKey(store.result),
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Из $fromCurrency в $toCurrency',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
