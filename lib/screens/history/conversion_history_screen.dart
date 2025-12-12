import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../stores/conversion_store.dart';

class ConversionHistoryScreen extends StatelessWidget {
  const ConversionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<ConversionStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('История конверсий'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              store.clearHistory();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: store.history.length,
        itemBuilder: (_, index) => ListTile(title: Text(store.history[index])),
      ),
    );
  }
}
