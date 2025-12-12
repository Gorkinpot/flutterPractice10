import 'package:flutter/material.dart';

class FavoriteCurrenciesScreen extends StatelessWidget {
  FavoriteCurrenciesScreen({super.key});

  final List<String> favorites = ['USD', 'EUR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Избранные валюты')),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (_, index) => ListTile(title: Text(favorites[index])),
      ),
    );
  }
}
