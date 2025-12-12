import 'package:mobx/mobx.dart';

part 'alert_store.g.dart';

class AlertStore = _AlertStore with _$AlertStore;

abstract class _AlertStore with Store {
  @observable
  ObservableList<String> alerts = ObservableList<String>();

  @action
  void addAlert(String text) {
    alerts.add(text);
  }
}
