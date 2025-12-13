import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../stores/exchange_rate_store.dart';

class ExchangeRatesScreen extends StatelessWidget {
  ExchangeRatesScreen({super.key});

  final ExchangeRateStore rateStore = GetIt.I<ExchangeRateStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Курсы валют')),
      body: Observer(
        builder: (_) {
          final mainRates = rateStore.rates.entries.toList();
          final favs = rateStore.favorites;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (favs.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Избранные валюты',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ...favs.map((key) {
                  final rate = rateStore.getRate(key);
                  return ListTile(
                    title: Text(key),
                    trailing: Text(rate.toStringAsFixed(4)),
                    leading: IconButton(
                      icon: const Icon(Icons.star, color: Colors.amber),
                      onPressed: () => rateStore.toggleFavorite(key),
                    ),
                  );
                }).toList(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Все курсы',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ...mainRates.map((e) {
                  final isFav = favs.contains(e.key);
                  return ListTile(
                    title: Text(e.key),
                    trailing: Text(e.value.toStringAsFixed(4)),
                    leading: IconButton(
                      icon: Icon(
                        isFav ? Icons.star : Icons.star_border,
                        color: isFav ? Colors.amber : null,
                      ),
                      onPressed: () => rateStore.toggleFavorite(e.key),
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
