import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/stores/exchange_rate_store.dart';
import '../../services/exchange_rate_service.dart';

class ExchangeRatesScreen extends StatelessWidget {
  ExchangeRatesScreen({super.key});

  final ratesService = GetIt.I<ExchangeRateStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Курсы валют')),
      body: ListView(
        children: ratesService.rates.entries
            .map((e) => ListTile(
          title: Text(e.key),
          trailing: Text(e.value.toString()),
        ))
            .toList(),
      ),
    );
  }
}
