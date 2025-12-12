import 'package:project/models/rate_alert.dart';

class AlertService {
  List<RateAlert> alerts = [];

  void addAlert(RateAlert alert) {
    alerts.add(alert);
  }

  void removeAlert(RateAlert alert) {
    alerts.remove(alert);
  }
}
