import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/stores/conversion_store.dart';

class ConversionHistoryScreen extends StatelessWidget {
  const ConversionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<ConversionStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('История конверсий'),
      ),
      body: AnimatedBuilder(
        animation: store,
        builder: (_, __) {
          if (store.history.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.history, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'История пуста',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: store.history.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(store.history[index]),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  store.removeAt(index);
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.currency_exchange),
                    title: Text(
                      store.history[index],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        store.removeAt(index);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
