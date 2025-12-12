import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/store/converter_store.dart';
import 'package:get_it/get_it.dart';
import 'package:project/services/conversion_service.dart';

class CurrencyConverterScreen extends StatelessWidget {
  final ConverterStore store = ConverterStore(GetIt.I<ConversionService>());

  CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Конвертер валют')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Observer(
              builder: (_) => TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Сумма'),
                onChanged: (v) => store.setAmount(double.tryParse(v) ?? 0.0),
              ),
            ),
            Observer(
              builder: (_) => DropdownButton<String>(
                value: store.fromCurrency,
                items: ['USD', 'EUR', 'RUB']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: store.setFromCurrency,
              ),
            ),
            Observer(
              builder: (_) => DropdownButton<String>(
                value: store.toCurrency,
                items: ['USD', 'EUR', 'RUB']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: store.setToCurrency,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: store.convert,
              child: Text('Конвертировать'),
            ),
            Observer(builder: (_) => Text('Результат: ${store.result}')),
          ],
        ),
      ),
    );
  }
}
