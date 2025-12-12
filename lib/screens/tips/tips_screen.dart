import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/stores/tips_store.dart';
import '../../services/tips_service.dart';

class TipsScreen extends StatelessWidget {
  TipsScreen({super.key});

  final tipsService = GetIt.I<TipsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Советы и статьи')),
      body: ListView.builder(
        itemCount: tipsService.tips.length,
        itemBuilder: (_, index) => ListTile(title: Text(tipsService.tips[index])),
      ),
    );
  }
}
