import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/stores/alert_store.dart';
import '../../services/alert_service.dart';

class RateAlertsScreen extends StatelessWidget {
  RateAlertsScreen({super.key});

  final alertService = GetIt.I<AlertStore>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Уведомления о курсах')),
      body: Column(
        children: [
          TextField(controller: controller, decoration: const InputDecoration(labelText: 'Добавить уведомление')),
          ElevatedButton(
            onPressed: () {
              if(controller.text.isNotEmpty) {
                alertService.addAlert(controller.text);
                controller.clear();
              }
            },
            child: const Text('Добавить'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alertService.alerts.length,
              itemBuilder: (_, index) => ListTile(title: Text(alertService.alerts[index])),
            ),
          ),
        ],
      ),
    );
  }
}
