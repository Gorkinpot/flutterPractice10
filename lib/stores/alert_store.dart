import 'package:flutter/foundation.dart';
import '../models/rate_alert.dart';

class AlertStore extends ChangeNotifier {
  final List<RateAlert> _alerts = [];

  List<RateAlert> get alerts => List.unmodifiable(_alerts);

  void addAlert(RateAlert alert) {
    _alerts.insert(0, alert);
    notifyListeners();
  }

  void removeAlert(int index) {
    _alerts.removeAt(index);
    notifyListeners();
  }

  void toggle(int index) {
    _alerts[index].enabled = !_alerts[index].enabled;
    notifyListeners();
  }

  void clear() {
    _alerts.clear();
    notifyListeners();
  }
}
