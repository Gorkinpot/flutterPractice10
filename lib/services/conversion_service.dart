import 'package:project/models/conversion.dart';

class ConversionService {
  final List<Conversion> _history = [];

  List<Conversion> get history => List.unmodifiable(_history);

  void add(Conversion c) {
    _history.insert(0, c);
  }

  void clear() => _history.clear();

  void removeAt(int index) {
    if (index >= 0 && index < _history.length) _history.removeAt(index);
  }
}
