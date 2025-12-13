import 'package:mobx/mobx.dart';
import '../models/tip.dart';

part 'tips_store.g.dart';

class TipsStore = _TipsStore with _$TipsStore;

abstract class _TipsStore with Store {
  @observable
  ObservableList<Tip> tips = ObservableList.of([
    Tip(text: 'Сравнивайте курсы перед обменом'),
    Tip(text: 'Используйте выгодные банки'),
    Tip(text: 'Следите за курсами каждый день'),
  ]);

  @action
  void addTip(String text) {
    tips.insert(0, Tip(text: text));
  }

  @action
  void removeTip(int index) {
    tips.removeAt(index);
  }

  @action
  void toggleFavorite(int index) {
    tips[index].favorite = !tips[index].favorite;
  }
}
