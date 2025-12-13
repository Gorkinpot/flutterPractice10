import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../stores/alert_store.dart';
import '../../models/rate_alert.dart';

class RateAlertsScreen extends StatefulWidget {
  const RateAlertsScreen({super.key});

  @override
  State<RateAlertsScreen> createState() => _RateAlertsScreenState();
}

class _RateAlertsScreenState extends State<RateAlertsScreen> {
  final store = GetIt.I<AlertStore>();

  String from = 'USD';
  String to = 'EUR';
  bool isGreater = true;
  final valueController = TextEditingController();
  int filter = 0;

  @override
  Widget build(BuildContext context) {
    final alerts = store.alerts.where((a) {
      if (filter == 1) return a.enabled;
      if (filter == 2) return !a.enabled;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления о курсах'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            tooltip: 'Проверить',
            onPressed: _simulate,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Очистить все',
            onPressed: () {
              setState(store.clear);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _createPanel(),
            const SizedBox(height: 12),
            _filterTabs(),
            const SizedBox(height: 12),
            Expanded(
              child: alerts.isEmpty
                  ? const Center(child: Text('Нет уведомлений'))
                  : ListView.builder(
                itemCount: alerts.length,
                itemBuilder: (_, i) => _alertTile(alerts[i], i),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _currency(from, (v) => setState(() => from = v)),
            const Text('→'),
            _currency(to, (v) => setState(() => to = v)),
            const SizedBox(width: 8),
            DropdownButton<bool>(
              value: isGreater,
              items: const [
                DropdownMenuItem(value: true, child: Text('Выше')),
                DropdownMenuItem(value: false, child: Text('Ниже')),
              ],
              onChanged: (v) => setState(() => isGreater = v!),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 80,
              child: TextField(
                controller: valueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Курс'),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _add,
              child: const Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterTabs() {
    return Row(
      children: [
        _filterBtn('Все', 0),
        _filterBtn('Активные', 1),
        _filterBtn('Отключённые', 2),
      ],
    );
  }

  Widget _filterBtn(String text, int value) {
    final active = filter == value;
    return Expanded(
      child: ElevatedButton(
        onPressed: () => setState(() => filter = value),
        style: ElevatedButton.styleFrom(
          backgroundColor: active ? null : Colors.grey.shade300,
          foregroundColor: active ? null : Colors.black,
        ),
        child: Text(text),
      ),
    );
  }

  Widget _alertTile(RateAlert alert, int index) {
    return Card(
      child: ListTile(
        leading: Switch(
          value: alert.enabled,
          onChanged: (_) => setState(() => store.toggle(index)),
        ),
        title: Text(
          '${alert.from} → ${alert.to} '
              '${alert.isGreater ? 'выше' : 'ниже'} '
              '${alert.value}',
        ),
        subtitle: Text('Создано: ${_fmt(alert.createdAt)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (alert.enabled)
              IconButton(
                icon: const Icon(Icons.notifications_active),
                tooltip: 'Проверить',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Уведомление: ${alert.from} '
                            '${alert.isGreater ? 'превысил' : 'упал ниже'} '
                            '${alert.value}',
                      ),
                    ),
                  );
                },
              ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Удалить',
              onPressed: () => setState(() => store.removeAlert(index)),
            ),
          ],
        ),
      ),
    );
  }


  Widget _currency(String value, ValueChanged<String> onChanged) {
    const list = ['USD', 'EUR', 'RUB', 'GBP', 'JPY'];

    return DropdownButton<String>(
      value: value,
      items: list
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (val) {
        if (val != null) {
          onChanged(val);
        }
      },
    );
  }


  void _add() {
    final val = double.tryParse(valueController.text);
    if (val == null) return;

    store.addAlert(
      RateAlert(
        from: from,
        to: to,
        value: val,
        isGreater: isGreater,
        createdAt: DateTime.now(),
      ),
    );
    valueController.clear();
    setState(() {});
  }

  void _simulate() {
    final activeAlerts = store.alerts.where((a) => a.enabled).toList();
    if (activeAlerts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Нет активных уведомлений')),
      );
      return;
    }

    for (var alert in activeAlerts) {
      final fromRate = fakeRates[alert.from] ?? 1.0;
      final toRate = fakeRates[alert.to] ?? 1.0;
      final currentRate = toRate / fromRate;

      if ((alert.isGreater && currentRate > alert.value) ||
          (!alert.isGreater && currentRate < alert.value)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Сработало уведомление: ${alert.from} → ${alert.to} '
                  '${alert.isGreater ? 'выше' : 'ниже'} ${alert.value}',
            ),
          ),
        );
      }
    }
  }


  String _fmt(DateTime d) =>
      '${d.day}.${d.month}.${d.year}';
}

final Map<String, double> fakeRates = {
  'USD': 1.0,
  'EUR': 0.92,
  'RUB': 75.0,
  'GBP': 0.82,
  'JPY': 140.0,
};
