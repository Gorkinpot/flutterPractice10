import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/stores/tips_store.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final store = GetIt.I<TipsStore>();
  final searchController = TextEditingController();
  final addController = TextEditingController();
  bool showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final filteredTips = store.tips.where((tip) {
      final matchesSearch = tip.text.toLowerCase().contains(searchController.text.toLowerCase());
      final matchesFavorite = showFavoritesOnly ? tip.favorite : true;
      return matchesSearch && matchesFavorite;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Советы и статьи'),
        actions: [
          IconButton(
            icon: Icon(showFavoritesOnly ? Icons.star : Icons.star_border),
            tooltip: 'Показать избранные',
            onPressed: () => setState(() => showFavoritesOnly = !showFavoritesOnly),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Поиск',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: addController,
                    decoration: const InputDecoration(
                      labelText: 'Добавить новый совет',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (addController.text.isEmpty) return;
                    store.addTip(addController.text.trim());
                    addController.clear();
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: filteredTips.isEmpty
                  ? const Center(child: Text('Советов не найдено'))
                  : ListView.builder(
                itemCount: filteredTips.length,
                itemBuilder: (_, index) {
                  final tip = filteredTips[index];
                  return Card(
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(
                          tip.favorite ? Icons.star : Icons.star_border,
                          color: tip.favorite ? Colors.amber : null,
                        ),
                        onPressed: () => setState(() => store.toggleFavorite(store.tips.indexOf(tip))),
                      ),
                      title: Text(tip.text),
                      subtitle: Text('Добавлено: ${tip.createdAt.day}.${tip.createdAt.month}.${tip.createdAt.year}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => setState(() => store.removeTip(store.tips.indexOf(tip))),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
