import 'package:mobx/mobx.dart';

part 'tips_store.g.dart';

class TipsStore = _TipsStore with _$TipsStore;

abstract class _TipsStore with Store {
  @observable
  ObservableList<String> tips = ObservableList.of([
    'Сравнивайте курсы перед обменом',
    'Используйте выгодные банки',
    'Следите за курсами каждый день',
  ]);
}
